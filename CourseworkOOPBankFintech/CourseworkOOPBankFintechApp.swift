//
//  CourseworkOOPBankFintechApp.swift
//  CourseworkOOPBankFintech
//
//  Created by Макс Лахман on 17.05.2024.
//

import SwiftUI
import SwiftData

@main
struct CourseworkOOPBankFintechApp: App {
    let container: ModelContainer
    
    
    @StateObject var splashScreenViewModel = SplashScreenViewModel()
    @StateObject var tabBarViewModel = TabBarViewModel()
    @StateObject var сardListViewModel = CardItemViewModel()
    @StateObject var createCardViewModel = CreateCardViewModel()
    @StateObject var itemCardViewModel = ItemCardViewModel()
    @StateObject var userViewModel = UserViewModel()
    @StateObject var userAdditionTeamUserViewModel =  CreateTeamUserViewModel()
    @StateObject var receiveViewModel = ReceiveViewModel()
    @StateObject var salaryCalculatorViewModel = SalaryCalculatorViewModel()
    @StateObject var createTeamViewModel = CreateTeamViewModel()
    @StateObject private var settingsCoordinator = SettingsCoordinator()
    @StateObject private var homeCoordinator = HomeCoordinator()
    
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .modelContainer(
                    container
                )
                .preferredColorScheme(
                    .dark
                )
                .environmentObject(
                    userViewModel
                ).environmentObject(
                    tabBarViewModel
                )
                .environmentObject(
                    userAdditionTeamUserViewModel
                )
                .environmentObject(
                    splashScreenViewModel
                )
                .environmentObject(
                    homeCoordinator
                )
                .environmentObject(
                    settingsCoordinator
                )
                .environmentObject(
                    сardListViewModel
                )
                .environmentObject(
                    createCardViewModel
                )
                .environmentObject(
                    itemCardViewModel
                )
                .environmentObject(
                    receiveViewModel
                )
                .environmentObject(
                    salaryCalculatorViewModel
                )
                .environmentObject(
                    createTeamViewModel
                )
            
            
        }
        
    }
    
    init() {
        let schema = Schema(
            [
                Card.self,
                TeamModel.self,
                User.self,
                TransactionItemDataModel.self
            ]
        )
        let config = ModelConfiguration(
            "MyCards",
            schema: schema
        )
        do {
            container = try ModelContainer(
                for: schema,
                configurations: config
            )
        } catch {
            fatalError(
                "Could not configure the container"
            )
        }
        print(
            URL.applicationSupportDirectory.path(
                percentEncoded: false
            )
        )
    }
}
