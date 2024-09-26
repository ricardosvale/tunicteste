//
//  ContentView.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 25/09/24.
//

import SwiftUI
struct AdicionarObjetivoView: View {
    @State private var objetivoTitulo: String = ""
    @State private var objetivoDescricao: String = ""
    @State private var linkText: String = ""
    @State private var isLinkFieldVisible: Bool = false
    @State private var anexados: [String] = []
    
    var body: some View {
        VStack(spacing: 20) {
            // Título do Objetivo
            Text("Objetivo 1")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            // Campos de Título e Descrição do Objetivo
            TextField("Aplicativo usando SwiftUI", text: $objetivoTitulo)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .foregroundColor(.white)
            
            TextField("Faça um aplicativo de não te consuma enquanto faz", text: $objetivoDescricao)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .foregroundColor(.white)
            
            // Links Section
            VStack(alignment: .leading) {
                
                
                // Botão para adicionar campo de Link
                HStack {
                    Text("Links")
                        .font(.title2)
                        .bold()
                        
                    Spacer()
                    Button(action: {
                        isLinkFieldVisible.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.cyan)
                            .font(.system(size: 24))
                    }
                 }
                
                // Campo de Texto para o Link
                if isLinkFieldVisible {
                    VStack {
                        TextField("Insira o link", text: $linkText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                           
                        
                        Button(action: {
                            if !linkText.isEmpty {
                                anexados.append(linkText)
                                linkText = ""
                                isLinkFieldVisible = false
                            }
                        }) {
                            Text("Anexar link")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.cyan)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                    .frame(minHeight: 150)
                    .background(.purple)
                    .transition(.slide)
                    
                }
                
                // Exibição dos links anexados
                ForEach(anexados, id: \.self) { link in
                    Text(link)
                        .frame(maxWidth:.infinity, minHeight: 40)
                        .background(.purple.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.bottom, 5)
                        .padding(.horizontal)
                }
            }
            .cornerRadius(10)
            
            Spacer()
            
            // Botão de Adicionar Objetivo
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
        }
        .padding()
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct AdicionarObjetivoView_Previews: PreviewProvider {
    static var previews: some View {
        AdicionarObjetivoView()
    }
}


#Preview {
    AdicionarObjetivoView()
}
