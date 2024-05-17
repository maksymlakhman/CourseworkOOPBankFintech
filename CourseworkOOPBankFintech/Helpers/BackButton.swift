//
//  BackButton.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 12.04.2024.
//

import SwiftUI


struct BackButton<CoordinatorType>: View where CoordinatorType: CoordinatorProtocol {
    var coordinator: CoordinatorType

    init(coordinator: CoordinatorType) {
        self.coordinator = coordinator
    }

    var body: some View {
        Button(action: {
            if let homeCoordinator = coordinator as? HomeCoordinator {
                // Проверяем, есть ли активные полноэкранные покрытия или sheet
                if let fullScreenCover = homeCoordinator.homeFullScreenCover {
                    // Закрываем полноэкранные покрытия поочередно
                    homeCoordinator.dismissFullScreenCover(fullScreenCover: fullScreenCover)
                } else if let sheet = homeCoordinator.homeSheet {
                    // Закрываем sheet, если она активна
                    homeCoordinator.dismissSheet(sheet: sheet)
                } else {
                    // В остальных случаях просто выполняем pop
                    coordinator.pop()
                }
            } else if let settingsCoordinator = coordinator as? SettingsCoordinator {
                // Проверяем, есть ли активные полноэкранные покрытия или sheet
                if let fullScreenCover = settingsCoordinator.fullScreenCover {
                    // Закрываем полноэкранные покрытия поочередно
                    settingsCoordinator.dismissFullScreenCover(fullScreenCover: fullScreenCover)
                } else if let sheet = settingsCoordinator.sheet {
                    // Закрываем sheet, если она активна
                    settingsCoordinator.dismissSheet(sheet: sheet)
                } else {
                    // В остальных случаях просто выполняем pop
                    coordinator.pop()
                }
            } else {
                // В остальных случаях просто выполняем pop
                coordinator.pop()
            }
        }, label: {
            ZStack {
                Circle()
                    .fill(Color.gray)

                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16, alignment: .center)
                    .padding(14)
                    .foregroundColor(Color("MainBackgroundIconColor"))
            }
            .frame(width: 20, height: 20, alignment: .center)
            .padding(.leading, 10)
        })
    }
}




