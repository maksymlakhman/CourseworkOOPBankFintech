//
//  MoneyPanelView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 18.04.2024.
//

import SwiftUI

struct MoneyPanelView: View {
    
    var card: Card
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(card.hexColor))
            VStack(alignment: .leading) {
                Text(card.name).font(.title2)
                Text(String(format: "%.0f", card.coins - totalTransactionAmount(transactions: card.transactionItemsDataModel ?? [])))
                    .foregroundStyle(.secondary)
            }
            .foregroundColor(Color("MainTextAndForegroundIconColor"))
            
        }
        .frame(width: UIScreen.main.bounds.width / 1.4, height: 150)
    }
    
    private func totalTransactionAmount(transactions : [TransactionItemDataModel]) -> Double {
        var totalAmount : Double = 0.0
        for transaction in transactions {
            totalAmount += transaction.userTransfers
        }
        return totalAmount
    }
    
}

#Preview {
    let preview = Preview(Card.self)
    let cards = Card.sampleCards
    preview.addExamples(Card.sampleCards)
    return MoneyPanelView(card: cards[0])
        .modelContainer(preview.container)
        .environmentObject(CardItemViewModel())
}
