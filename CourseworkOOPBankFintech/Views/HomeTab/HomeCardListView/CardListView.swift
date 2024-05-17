////
////  CardView.swift
////  KursovaOOPV2.0
////
////  Created by Макс Лахман on 29.02.2024.
////
//
import SwiftUI

struct CardListView: View {
    
    @EnvironmentObject private var coordinator : HomeCoordinator
    
    var body: some View {
        CardList()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        coordinator.push(.updateHeaderView)
                    } label: {
                        HeaderView()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        coordinator.push(.createCardView)
                    } label: {
                        ZStack{
                            Image(systemName: "folder.fill.badge.plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: 26)
                                .padding(8)
                                .foregroundColor(Color("MainTextAndForegroundIconColor"))
                                .background(Color("MainBackgroundIconColor"))
                                .clipShape(Circle())
                                .overlay {
                                    Circle().foregroundColor(Color("MainRedMainColor")).frame(width: 7, height: 7).position(CGPoint(x: 39.0, y: 20))
                                }
                        }
                    }
                }
            }
    }
}

#Preview {
    CardListView()
        .environmentObject(HomeCoordinator())
}



