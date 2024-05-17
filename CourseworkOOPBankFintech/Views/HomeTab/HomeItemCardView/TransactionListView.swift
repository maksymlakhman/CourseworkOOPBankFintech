//
//  TransactionListView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 19.04.2024.
//

import SwiftUI

struct TransactionListView: View {
    
    @Environment(\.modelContext) private var context
    
    let card : Card
    
    var body: some View {
        List() {
            let transaction = card.transactionItemsDataModel?.sorted(using: KeyPathComparator(\TransactionItemDataModel.userTransfers)) ?? []
            Section("Транзакції") {
                ForEach(transaction, id: \.self) { item in
                    NavigationLink {
                        TransactionDetailsView(transactionItemDataModel: item)
                    } label: {
                        Text(String(format: "-%.2f", item.userTransfers))
                            .font(.footnote)
                            .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                    }
                    
                    
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        if let item = card.transactionItemsDataModel?[index] {
                            context.delete(item)
                        }
                        
                    }
                }
            }
            .padding(5)
            .font(.title)
            
            
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        .padding(.bottom, 70)
        
    }
    
}

#Preview{
    let preview = Preview(Card.self)
    let card = Card.sampleCards
    preview.addExamples(card)
    return TransactionListView(card: card[0])
        .modelContainer(preview.container)
}


