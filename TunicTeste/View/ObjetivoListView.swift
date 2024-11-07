//
//  ObjetivoListView.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 06/11/24.
//

import SwiftUI

struct ObjetivoListView: View {
    @EnvironmentObject var desafioViewModel: DesafioViewModel
//    @State var desafioID = "E91FEF1E-FF2B-42C9-BBF8-DAC63A307CE0"
//    let objetivos = Objetivo.objetivosList
    
    var body: some View {
        List {
            ForEach(desafioViewModel.objetivos, id: \.id) { objetivo in
                ObjectivoCardAluno(
                    objectiveName: objetivo.nome,
                    objectiveStatus: objetivo.status ?? "Indisponivel"
                )
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .onAppear{
            desafioViewModel.loadObjetivos(for: desafioViewModel.desafioID)
        }
    }
}

