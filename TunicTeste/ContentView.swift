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
                        withAnimation{
                            isLinkFieldVisible.toggle()
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .background(.green)
                            .foregroundColor(.black)
                            .font(.system(size: 24))
                            .cornerRadius(8)
                    }
                }
                
                // Campo de Texto para o Link
                if isLinkFieldVisible {
                    VStack {
                        ZStack(alignment: .leading) {
                                                   // Placeholder manual com cor branca
                                                   if linkText.isEmpty {
                                                       Text("Digite o link")
                                                           .foregroundColor(.white)
                                                           .padding(.leading, 10)
                                                   }
                            TextField("", text: $linkText)
                                                       .padding()
                                                       .background(Color.black.opacity(0.6))
                                                       .cornerRadius(8)
                                                       .foregroundColor(.white)
                                               }
                                               
                                               Button(action: {
                                                   if !linkText.isEmpty {
                                                       anexados.append(linkText)
                                                       linkText = ""
                                                       isLinkFieldVisible = false
                                                   }
                                               }) {
                                                   Text("Anexar link")
                                                       .foregroundColor(.white)
                                                       .padding()
                                                       .frame(maxWidth: .infinity)
                                                       .background(Color.cyan)
                                                       .cornerRadius(8)
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
