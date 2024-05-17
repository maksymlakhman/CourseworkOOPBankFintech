//
//  HomeItemAdditionalFunctionalityCard.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 19.04.2024.
//

import SwiftUI

struct HomeItemAdditionalFunctionalityCard: View {
    
    @Environment(\.modelContext) private var context
    
    var selectedCard : Card
    
    @EnvironmentObject var itemCardViewModel : ItemCardViewModel
    
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 40, bottomTrailingRadius: 40, topTrailingRadius: 0, style: .continuous)
                .fill(selectedCard.hexColor)
            
            VStack(alignment: .trailing, spacing: 0) {
                Spacer()
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 0){
                        HStack(alignment: .bottom, spacing: 0) {
                            Text(String(format: "%.2f", selectedCard.coins - itemCardViewModel.totalTransactionAmount(transactions: selectedCard.transactionItemsDataModel ?? [])))
                                .font(.system(size: 32, weight: .medium, design: .serif))
                        }
                    }
                    Spacer()
                    Image(selectedCard.logoCard.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 40)
                }
                .padding(20)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.mainBackgroundIcon)
                        .padding(.bottom, 20)
                        .padding(.horizontal, 20)
                    HStack(alignment: .center){
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Зараховано")
                            Text(String(format: "%.2f", selectedCard.coins))
                        }
                        Spacer()
                        Divider()
                            .background(Color(selectedCard.hexColor))
                        
                            .padding(.vertical, 20)
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Витрачено")
                            if itemCardViewModel.totalTransactionAmount(transactions: selectedCard.transactionItemsDataModel ?? []) == 0.00 {
                                Text(String(format: "%.2f", itemCardViewModel.totalTransactionAmount(transactions: selectedCard.transactionItemsDataModel ?? [])))
                            } else {
                                Text(String(format: "-%.2f", itemCardViewModel.totalTransactionAmount(transactions: selectedCard.transactionItemsDataModel ?? [])))
                            }
                            
                        }
                        Spacer()
                    }
                    .padding(.vertical, 20)
                }
                .frame(maxHeight: UIScreen.main.bounds.height / 7)
            }
            
        }
        .navigationTitle(selectedCard.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
        .frame(width: UIScreen.main.bounds.width / 1, height: UIScreen.main.bounds.height / 4)
    }
    

}

#Preview {
    let preview = Preview(TeamModel.self)
    let card = Card.sampleCards
    preview.addExamples(card)
    return HomeItemAdditionalFunctionalityCard(selectedCard: card[1])
        .modelContainer(preview.container)
}
