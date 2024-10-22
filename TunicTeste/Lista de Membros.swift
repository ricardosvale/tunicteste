//
//  Lista de Membros.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 22/10/24.
//

import SwiftUI

struct Lista_de_Membros: View {
    var body: some View {
        VStack{
            ZStack{
                HeaderView()
                HStack{
                    Spacer()
                    Text("Lista de Membros")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .ignoresSafeArea()
            
            
            VStack(alignment: .leading, spacing: 10){
                Text("Mentor")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding(.bottom, 5)
                HStack{
                    Image("Mentor")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(.purple), lineWidth: 2))
                        .padding(8)
                    Text("Mentor")
                        .font(.title3)
                    
                    Spacer()
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.purple), lineWidth: 2)
                )
            }
            .padding(.horizontal)
            
            Divider()
                .frame(maxWidth: 300, minHeight: 3)
                .overlay(Color(.purple))
                .padding(30)
            
            VStack(alignment: .leading, spacing: 10){
                Text("Alunos")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding(.bottom, 5)
                
                ScrollView {
                    
                    ForEach(0..<6){ index in
                        
                        HStack{
                            Image("Mentor")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color(.purple), lineWidth: 2))
                                .padding(8)
                            Text("Aluno")
                                .font(.title3)
                            Spacer()
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.purple),lineWidth: 2)
                        )
                    }.padding(2)
                }
            }.padding(.horizontal, 15)
        }
    }
    
}

#Preview {
    Lista_de_Membros()
}
