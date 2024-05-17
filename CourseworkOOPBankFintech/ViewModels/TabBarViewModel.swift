//
//  TabBarViewModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 18.04.2024.
//

import Foundation

enum Tabs : String, Codable {
    case home = "Дім"
    case settings = "Налаштування"
}


final class TabBarViewModel : ObservableObject {
    @Published var rotationAngle: Double = 0.0
    @Published var animate = false
    @Published var currentTab : Tabs = .home
    @Published var isSettingsTabActive = false
}
