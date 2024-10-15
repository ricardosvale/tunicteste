//
//  RegistroAluno.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 15/10/24.
//

import SwiftUI

struct RegistroAluno: View {
    
    @State private var nomeCompleto: String = ""
    @State private var email: String = ""
    @State private var senha: String = ""
    @State private var confirmarSenha: String = ""
    @State private var isAluno: Bool = true
    
    var body: some View {
        VStack {
            Text("Registro")
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)
            
           VStack(spacing: 20) {
                TextField("Nome Completo", text: $nomeCompleto)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 1)
                    )
                
                TextField("E-mail", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 1)
                    )
                
                SecureField("Senha", text: $senha)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 1)
                    )
                
                SecureField("Confirme a Senha", text: $confirmarSenha)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 1)
                    )
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)
            
            // Seletor de tipo de usuário
            HStack () {
                Button(action: {
                    isAluno = false
                }) {
                    HStack {
                        Circle()
                            .stroke(isAluno ? Color.gray : Color.black, lineWidth: 2)
                            .frame(width: 20, height: 20)
                            .overlay(
                                isAluno ? nil : Circle().fill(Color.black).frame(width: 12, height: 12)
                            )
                        Text("Sou professor")
                            .foregroundColor(.black)
                    }
                }
                
                Button(action: {
                    isAluno = true
                }) {
                    HStack {
                        Circle()
                            .stroke(isAluno ? Color.black : Color.gray, lineWidth: 2)
                            .frame(width: 20, height: 20)
                            .overlay(
                                isAluno ? Circle().fill(Color.black).frame(width: 12, height: 12) : nil
                            )
                        Text("Sou aluno")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.top, 30)
            
            Spacer()
            
            // Botão de criação de conta
            Button(action: {
                // Ação de criação de conta
            }) {
                Text("Criar conta")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color(UIColor.systemBackground))
               
    }
}

struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        RegistroAluno()
    }
}

#Preview {
    RegistroAluno()
}
