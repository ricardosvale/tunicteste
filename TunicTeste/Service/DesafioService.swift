
import Foundation

class DesafioService {
    
    static var singleton = DesafioService()
    
    func getDesafios(completion: @escaping (_ desafiosResponse: [Desafio]) -> Void){
        
        let url = URL(string: "http://localhost:8080/desafios")
        guard let url = url else { return }
        
        var urlRequest = URLRequest(url: url )
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            guard let data = data else {return}
            let jsonDecoder = JSONDecoder()
            do {
                let desafiosResponse = try jsonDecoder.decode([Desafio]?.self, from: data)
                
                if let results = desafiosResponse {
                    completion(results)
                } else {
                    completion([])
                }
            } catch {
                print("Error decoding Desafios JSON : \(error)")
            }
        }
        task.resume()
    }
    
    func getDesafioById(id: String, completion: @escaping (_ desafioResponse: Desafio?) -> Void){
        
        let url = URL(string: "http://localhost:8080/desafios/" + id )
        guard let url = url else { return }
        
        var urlRequest = URLRequest(url: url )
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            guard let data = data else {return}
            let jsonDecoder = JSONDecoder()
            do {
                let desafiosResponse = try jsonDecoder.decode(Desafio?.self, from: data)
                
                if let results = desafiosResponse {
                    completion(results)
                } else {
                    completion(nil)
                }
            } catch {
                print("Error decoding Desafio JSON : \(error)")
            }
        }
        task.resume()
    }
    func objetivoPorDesafio(desafioID: String, onComplete: @escaping (_ objetivos: [Objetivo]?) -> Void){
        
        guard let url = URL(string: "http://localhost:8080/desafios/\(desafioID)/objetivos") else { return }
        
        let task = URLSession.shared.dataTask(with:url) { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let objetivoResponse = try JSONDecoder().decode([Objetivo].self, from: data)
                   
                        DispatchQueue.main.async {
                            onComplete(objetivoResponse)
                        }
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }else{
                    print("Erro no Servidor")
                }
            } else {
                print(error!)
            }
        }
        task.resume()
    }
    
    func createObjetivo(_ objetivo: Objetivo, desafioID: String, onComplete: @escaping (Objetivo?)-> Void){
        guard let url = URL(string: "http://localhost:8080/desafios/\(desafioID)/create/objetivos") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do{
            let jsonData = try JSONEncoder().encode(objetivo)
            request.httpBody = jsonData
        } catch {
            print("Erro ao codificar o objetivo: \(error)")
            onComplete(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro ao criar o objetivo: \(error)")
                onComplete(nil)
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Erro servidor")
                onComplete(nil)
                return
            }
            
            do{
                let objetivo = try JSONDecoder().decode(Objetivo.self, from: data)
                DispatchQueue.main.async {
                    onComplete(objetivo)
                }
            } catch {
                print("Erro ao decodificar o Objetivo: \(error)")
                onComplete(nil)
            }
        }
        task.resume()
    }
    
}
