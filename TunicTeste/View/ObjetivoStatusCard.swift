//
//  ObjetivoStatusCard.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 06/11/24.
//

import SwiftUI
struct ObjectivoStatusCard: View {
    let status: String
    
    private var statusColor: Color {
        switch status {
        case "Em Andamento":
            return Color(.orange)
        case "Concluído":
            return Color(.green)
        default:
            return Color(.gray)
        }
    }
    var body: some View {
        Text(status)
            .font(.title3)
            .padding(8)
            .background(statusColor)
            .cornerRadius(20)
            .foregroundStyle(Color.white)
    }
}

#Preview {
    ObjectivoStatusCard(status: "Em Andamento")
}
