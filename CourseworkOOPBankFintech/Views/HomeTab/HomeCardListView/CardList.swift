//
//  CardList.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import SwiftUI
import SwiftData

struct CardList: View {
    
    @EnvironmentObject private var cardListViewModel : CardItemViewModel
    @EnvironmentObject private var coordinator: HomeCoordinator
    @Environment(\.modelContext) private var context
    
    @Query private var cards: [Card]
    
    var body: some View {
        VStack {
            if cards.isEmpty {
                CardContentUnavailableView()
            } else {
                CoverFlowView(itemWidth: cardListViewModel.itemWidth, enableReflection: cardListViewModel.enableReflection, spacing: cardListViewModel.spacing, rotation: cardListViewModel.rotation, items: cards) { card in
                    Button {
                        coordinator.viewModel.selectedCard = card
                        coordinator.push(.itemCardView)
                    } label: {
                        MoneyPanelView(card: card)
                    }
                }
                .frame(maxHeight: 180)
                .padding(.vertical, 20)
                ActivitiesView(cards: cards)
                Spacer(minLength: 0)
            }
        }
    }
}




#Preview {
  let preview = Preview(Card.self)
  preview.addExamples(Card.sampleCards)
  return CardList()
        .modelContainer(preview.container)
        .environmentObject(CardItemViewModel())
}
