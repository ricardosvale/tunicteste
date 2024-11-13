//
//  DetalhesDesafioView.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 06/11/24.

import SwiftUI
 
struct DetalhesDesafioView: View {
    
    @StateObject var viewModel = DesafioViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment:.top) {
                HeaderView()
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 32))
                        }
                        
                        Spacer()
                        Text("HARUNO SAKURA")
                            .font(.system(size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                    
                        Button {
                            
                        } label: {
                            Image(systemName: "person.2.fill")
                                .font(.system(size: 24))
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment:.leading, spacing: 4) {
                        
                        Text("naruto.uzumaki@gmail.com")
                            .font(.system(size: 16))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("NOME DA TURMA")
                            .font(.system(size: 17))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.leading, 48)
                }
            }
            .foregroundColor(.white)
            
            Text("Desafios")
                .font(.custom("Poppins-Bold", size: 32))
                .foregroundColor(Color("darkPurple"))
                .padding(.top, -50)
                .padding(.horizontal)
            
            
            DesafioTabView()
            Text("Objetivos")
                .font(.custom("Poppins-Bold", size: 32))
                .foregroundColor(Color("darkPurple"))
                .padding(.horizontal)
                .padding(.top, -4)
            
            ObjetivoListView()
                .padding(.top, -20)
            
            Spacer()
            
//            Button("Interação", action: {})
        }
        .environmentObject(viewModel)
    }
    
}

#Preview {
    DetalhesDesafioView()
      
}

