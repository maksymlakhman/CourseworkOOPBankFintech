//
//  ButtonDeleteCard.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 19.04.2024.
//

import SwiftUI

struct ButtonDeleteCard: View {
    
    @EnvironmentObject private var coordinator : HomeCoordinator
    @Bindable var card : Card
    
    var body: some View {
        Button {
            coordinator.present(fullScreenCover: .extensionParametersCardView)
        } label: {
            ZStack {
                Circle()
                    .fill(.gray)
                Image(systemName: "scale.3d")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16, alignment: .center)
                    .padding(14)
                    .foregroundColor(Color("MainBackgroundIconColor"))
            }
            .frame(width: 20, height: 20, alignment: .center)
            .padding(.trailing, 10)
        }
    }
}

#Preview {
    let preview = Preview(TeamModel.self)
    let card = Card.sampleCards
    preview.addExamples(card)
    return ButtonDeleteCard(card: card[1])
        .modelContainer(preview.container)
        .environmentObject(HomeCoordinator())
}
