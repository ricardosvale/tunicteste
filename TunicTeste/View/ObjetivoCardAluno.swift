//
//  ObjetivoCardAluno.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 06/11/24.
//

import SwiftUI


struct ObjectivoCardAluno: View {
    let objectiveName: String
    let objectiveStatus: String
    
    var body: some View {
        HStack {
            Text(objectiveName)
                .font(.title2)
                .foregroundColor(.black)
                .lineLimit(4)
            Spacer()
            ObjectivoStatusCard(status: objectiveStatus)
            
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.purple), lineWidth: 1)
        )
    }

}

#Preview {
    ObjectivoCardAluno(objectiveName: "Teste", objectiveStatus: "Concluído")
        .padding()
}
