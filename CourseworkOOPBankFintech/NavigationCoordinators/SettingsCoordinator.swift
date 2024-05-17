//
//  SettingsCoordinator.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 06.03.2024.
//

import SwiftUI




enum Sheet1 : String, Identifiable {
    case lemon
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover1 : String, Identifiable {
    case olive
    
    var id: String {
        self.rawValue
    }
}


enum Page1 : String, Identifiable {
    case apple, banana, carrot
    
    var id: String {
        self.rawValue
    }
}

class SettingsCoordinator : ObservableObject, CoordinatorProtocol {
    func dismissSheet(sheet: Sheet1) {
        self.sheet = nil
    }
    
    func dismissFullScreenCover(fullScreenCover: FullScreenCover1) {
        self.fullScreenCover = nil
    }
    
    @Published var path = NavigationPath()
    @Published var sheet : Sheet1?
    @Published var fullScreenCover : FullScreenCover1?
    
    func push(_ page : Page1) {
        path.append(page)
    }
    
    func present(sheet : Sheet1) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover : FullScreenCover1) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }

    
    
    @ViewBuilder
    func build(page : Page1) -> some View {
        switch page {
        case .apple :
            AppleView()
        case .banana:
            BananaView()
        case .carrot:
            CarrotView()
        }
    }
    
    @ViewBuilder
    func build(sheet : Sheet1) -> some View {
        switch sheet {
        case .lemon :
            NavigationStack{
                LemonView()
            }
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover : FullScreenCover1) -> some View {
        switch fullScreenCover {
        case .olive :
            NavigationStack{
                OliveView()
            }
        }
    }
    
}
