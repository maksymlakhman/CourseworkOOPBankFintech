//
//  SettingsCoordinatorView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 06.03.2024.
//

import SwiftUI


struct SettingsCoordinatorView: View {
    @EnvironmentObject private var coordinator : SettingsCoordinator
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .apple)
                .tabItem {
                    Image(systemName: "gearshape").resizable().scaledToFit().frame(width: 22)
                }
                .navigationDestination(for: Page1.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                    coordinator.build(fullScreenCover: fullScreenCover)
                }
        }
    }
}

#Preview {
    SettingsCoordinatorView()
        .environmentObject(SettingsCoordinator())
}
