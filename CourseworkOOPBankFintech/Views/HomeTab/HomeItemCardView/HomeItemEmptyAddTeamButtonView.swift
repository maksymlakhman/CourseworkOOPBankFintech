//
//  HomeItemEmptyAddTeamButtonView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 19.04.2024.
//

import SwiftUI

struct HomeItemEmptyAddTeamButtonView: View {
    @EnvironmentObject private var coordinator : HomeCoordinator
    var selectedCard : Card
    var body: some View {
        Button {
            coordinator.present(fullScreenCover: .addTeamView)
        } label: {
            ZStack{
                Capsule()
                    .strokeBorder(Color(selectedCard.hexColor), style: .init(lineWidth: 2.2, dash: [4.5]))
                HStack {
                    Text("Додай команду")
                    Image(systemName: "plus.circle.fill")
                        .scaleEffect(1.4)
                }
                .foregroundStyle(Color(selectedCard.hexColor))
            }
            .frame(maxHeight: 70)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    let preview = Preview(Card.self)
    let card = Card.sampleCards
    preview.addExamples(card)
    return HomeItemEmptyAddTeamButtonView(selectedCard: card[0])
}
