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
                    Text("Links")
                        .font(.title2)
                        .bold()
                    
                    // Botão para adicionar campo de Link
                    HStack {
                        Button(action: {
                            isLinkFieldVisible.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.cyan)
                                .font(.system(size: 24))
                        }

                        Spacer()
                    }

                    // Campo de Texto para o Link
                    if isLinkFieldVisible {
                        VStack {
                            TextField("Insira o link", text: $linkText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.top, 5)
                                .padding(.bottom, 5)

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
                        }
                        .transition(.slide)
                    }

                    // Exibição dos links anexados
                    ForEach(anexados, id: \.self) { link in
                        Text(link)
                            .foregroundColor(.white)
                            .padding(.top, 5)
                    }
                }
                .padding()
                .background(Color.purple.opacity(0.3))
                .cornerRadius(10)

                Spacer()

                // Botão de Adicionar Objetivo
                Button(action: {
                    // Ação de adicionar objetivo
                }) {
                    Text("Adicionar objetivo")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.cyan)
                        .cornerRadius(10)
                }
                .padding(.bottom)
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
