//
//  CardContentUnavalivleView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 18.04.2024.
//

import SwiftUI

struct CardContentUnavailableView: View {
    @EnvironmentObject private var coordinator: HomeCoordinator
    var body: some View {
        ContentUnavailableView {
            Button {
                coordinator.push(.createCardView)
            } label: {
                VStack{
                    Image(systemName: "creditcard.fill")
                        .font(.largeTitle)
                    Text("Додати картку")
                        .font(.title)
                        .bold()
                }
                .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    CardContentUnavailableView()
        .environmentObject(CardItemViewModel())
}
