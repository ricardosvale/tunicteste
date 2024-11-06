//
//  DesafioCard.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 06/11/24.
//

import SwiftUI

struct DesafioCard: View {
    var tituloDesafio: String
    var descricaoDesafio: String
    var dataDesafio: Date
    var tipoDesafio: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.purple))

            VStack(alignment: .leading, spacing: 8) {
                Text(tituloDesafio)
                    .font(.system(size: 20))
                    .bold()
                
                Text(descricaoDesafio)
                    .font(.system(size: 14))
                
                Spacer()
                
                HStack {
                    Text(dateFormatter.string(from: dataDesafio))
                        .font(.system(size: 12))
                    
                    Spacer()
                        
                    Text(tipoDesafio)
                        .font(.system(size: 14))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 40).fill(Color.orange)
                        )
                        .frame(width: 97, height: 32)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 18)
        }
        .frame(width: 361, height: 180)
        .cornerRadius(18)
    }
    
    // Formatter para a data
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}

#Preview {
    DesafioCard(
        tituloDesafio: "Título",
        descricaoDesafio: "Descrição do desafio",
        dataDesafio: Date(),
        tipoDesafio: "Individual"
    )
}
