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
    @State private var tipoArquivo = ""
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
          
            TextField("Insira o título do objetivo", text: $tituloObjetivo)
                .padding()
                .background(Color.green.opacity(0.7))
                .cornerRadius(8)
                .foregroundColor(.white)
                .padding(.horizontal)
        }
        
        HStack{
            Text("Materias")
                .font(.title3)
                .padding(.leading)
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.green)
                    .frame(width: 35, height: 30)
                
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.black)
                    .font(.title2)
            }
            
        }
        .padding(.trailing)
        
    }
      
}

#Preview {
    ContentView()
}
