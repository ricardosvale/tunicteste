//
//  Untitled.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 06/11/24.
//

import SwiftUI

struct DesafioTabView: View {
    
    @EnvironmentObject var desafioViewModel: DesafioViewModel
    
    @State private var selectedPage = 0
    private let totalDesafios = 3
    var body: some View {
        TabView(selection: $selectedPage) {
            //let desafios = desafioViewModel.desafios
            //desafios.append()
            ForEach(0..<desafioViewModel.desafios.count, id: \.self) { index in
                
                let desafio = desafioViewModel.desafios[index]
                DesafioCard(
                    tituloDesafio: desafio.bigIdea ?? "", //"Desafio
                    descricaoDesafio:  desafio.bigIdea ?? "", //"Descrição do desafio
                    dataDesafio: Date(),
                    tipoDesafio: "Individual"
                )
                .padding(.horizontal, 16)
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 200)
        .padding(.horizontal, -8)
        .padding(.top, -30)
        
        HStack() {
            ForEach(0..<desafioViewModel.desafios.count, id: \.self) { index in
                Circle()
                    .fill(selectedPage == index ? Color.purple : Color.gray.opacity(0.4))
                    .frame(width: 12, height: 12)
            }
        }
        .frame(maxWidth: .infinity)
    }
}


