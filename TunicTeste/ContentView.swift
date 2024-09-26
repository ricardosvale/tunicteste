//
//  ContentView.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 25/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tituloObjetivo = ""
    @State private var descricaoObjetivo = ""
    @State private var arquivoAnexado: String? = nil
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Objetivo")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Insira o título do objetivo", text: $tituloObjetivo)
                .padding()
                .background(Color.green.opacity(0.7))
                .cornerRadius(8)
                .foregroundColor(.white)
                .padding(.horizontal)
            
            TextField("Insira a descrição do objetivo", text: $tituloObjetivo)
                .padding()
                .background(Color.green.opacity(0.7))
                .cornerRadius(8)
                .foregroundColor(.white)
                .padding(.horizontal)
            
            
            HStack{
                Text("Materias")
                    .font(.title3)
                    .padding(.leading)
                
                Spacer()
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.green)
                    .frame(width: 35, height: 30)
                    .overlay((Image(systemName: "plus.circle.fill")))
                    .foregroundColor(.black)
                    .font(.title3)
                    .padding(.trailing)
            }
            .padding(.top)
            
            Text("Tipo de arquivo (extensão, como: .pdf )")
                .multilineTextAlignment(.trailing)
                .foregroundColor(.gray)
                .padding(.leading, -70)
        }
        // List com Section e usar Head para descever o tipode arquivo
        
        
        VStack{
            ScrollView(.vertical){
            ForEach(0..<9){ number in
               
                    Label("AP2-2022.2.pdf", systemImage: "doc.on.doc")
                        .frame(maxWidth:.infinity, minHeight: 40)
                        .background(.purple.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.bottom, 5)
                        .padding(.horizontal)
                }
            }.frame(maxHeight: 250)
        }
        .foregroundColor(.black)
        .padding(5)
        
        //Botão anexar
        Button(action: {
            
        }){
            Label("Anexar arquivo", systemImage: "paperclip")
                .foregroundColor(.black)
                .font(.title3)
                .frame(maxWidth: .infinity)
                .padding([.bottom, .top], 20)
                .background(Color.purple.opacity(0.4))
                .cornerRadius(8)
        }
        .padding(.horizontal)
       
        
        Button(action: {
            // Ação de adicionar objetivo
        }) {
            Text("Adicionar objetivo")
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.cyan)
                .cornerRadius(8)
        }
        .padding()
        
       
        
    }
    func anexarArquivo(){
        arquivoAnexado = "AP2-2022.2.pdf"
    }
    
}

#Preview {
    ContentView()
}
