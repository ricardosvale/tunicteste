//
//  HeaderView.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 22/10/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            UnevenRoundedRectangle(cornerRadii: .init(
                bottomLeading: 60.0,
                bottomTrailing: 60.0
            )
                
            )
            .fill(Color(.purple))
            .frame(height: 175)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HeaderView()
}
