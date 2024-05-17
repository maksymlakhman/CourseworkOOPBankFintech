//
//  EditCardView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import SwiftUI
import SwiftData

struct ItemCardView: View {
    
    @EnvironmentObject private var coordinator : HomeCoordinator
    @Environment(\.modelContext) private var context
    @Query private var creatingTeamsModelData: [TeamModel]
    
    var selectedCard : Card
    var selectedArrayOfTransactions: [TransactionItemDataModel]
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10){
                
                HomeItemAdditionalFunctionalityCard(selectedCard: selectedCard)
                
                if creatingTeamsModelData.isEmpty {
                    HomeItemEmptyAddTeamButtonView(selectedCard: selectedCard)
                } else {
                    HorisontalSVAllTeams(card: selectedCard, teams: creatingTeamsModelData)
                }
                
                TransactionListView(card: selectedCard)
                
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton(coordinator: coordinator)
            }
            ToolbarItem(placement: .topBarTrailing) {
                ButtonDeleteCard(card: selectedCard)
            }
        }
    }
}

#Preview {
    let preview = Preview(TeamModel.self)
    let card = Card.sampleCards
    let transactionItemDataModel = TransactionItemDataModel.sampleTransactionItemDataModel
    preview.addExamples(card)
    preview.addExamples(transactionItemDataModel)
    return ItemCardView(selectedCard: card[1], selectedArrayOfTransactions: transactionItemDataModel)
        .modelContainer(preview.container)
        .environmentObject(HomeCoordinator())
        .environmentObject(ItemCardViewModel())
}










