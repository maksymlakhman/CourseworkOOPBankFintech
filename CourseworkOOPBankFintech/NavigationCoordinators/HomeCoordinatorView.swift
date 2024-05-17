//
//  HomeCoordinatorView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 06.03.2024.
//

import SwiftUI
//Створення EnvironmentObject коорднатора щоб передати далі
//дуже важливо створювати build(без build перехід не відбудеться)
struct HomeCoordinatorView: View {
    @EnvironmentObject private var coordinator : HomeCoordinator
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(homePage: .cardListView)
                .tabItem {
                    Image(systemName: "house.circle").resizable().scaledToFit().frame(width: 22)
                }
                .navigationDestination(for: HomePage.self) { homePage in
                    coordinator.build(homePage: homePage)
                }
                .sheet(item: $coordinator.homeSheet) { homeSheet in
                    coordinator.build(homeSheet: homeSheet)
                }
                .fullScreenCover(item: $coordinator.homeFullScreenCover) { homeFullScreenCover in
                    coordinator.build(homeFullScreenCover: homeFullScreenCover)
                }
        }
    }
}

#Preview {
    HomeCoordinatorView()
        .environmentObject(HomeCoordinator())
}
