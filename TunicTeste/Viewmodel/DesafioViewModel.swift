
import Foundation

class DesafioViewModel: ObservableObject{
    @Published var desafios: [Desafio]
    @Published var desafioById: Desafio?
    @Published var savedDesafio: Bool = false
    @Published var updatedDesafio: Bool = false
    @Published var objetivos: [Objetivo] = []
    @Published var objetivoCriado: Objetivo?
    @Published var selectedDesafioID: String? {
        didSet {
            if let id = selectedDesafioID {
                loadObjetivos(for: id){result in
                    
                }
            }
        }
    }
    
    init(){
        self.desafios = []
        fetchDesafios()
        
    }
    
    func fetchDesafios(){
        DesafioService.singleton.getDesafios { [weak self] desafios in
            DispatchQueue.main.async {
                self?.desafios = desafios
            }
        }
    }
    
    func getDesafioById(id: String, completion: @escaping (Bool) -> Void)  {
        DesafioService.singleton.getDesafioById(id: id) { desafio in
            DispatchQueue.main.async { [weak self] in
                if desafio == nil {
                    print("Desafio não encontrado")
                    completion(false)
                }else {
                    self?.desafioById = desafio
                    completion(true)
                }
            }
        }
    }
    
  func loadObjetivos(for desafioID: String, completion: @escaping (Bool) -> Void){
        DesafioService.singleton.objetivoPorDesafio(desafioID: desafioID){ [weak self] objetivos in
            if let objetivos = objetivos {
                DispatchQueue.main.async {
                    self?.objetivos = objetivos
                    completion(true)
                }
            } else{
                print("Nenhum objetivo encontrado para o desafio com ID: \(desafioID)")
                completion(false)
            }
        }
    }
    
    func createObjetivo(_ objetivo: Objetivo, desafioID:String){
        DesafioService.singleton.createObjetivo(objetivo, desafioID: desafioID){ [weak self] objetivoCriado in
            DispatchQueue.main.async{
                self?.objetivoCriado = objetivoCriado
            }
        }
    }
}
