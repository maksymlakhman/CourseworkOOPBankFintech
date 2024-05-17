//
//  TabBarView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//
import SwiftUI

struct TabBarView: View {

    @EnvironmentObject private var tabBarViewModel : TabBarViewModel
    
    var body: some View {
        ZStack{
            TabView(selection: $tabBarViewModel.currentTab){
                Group{
                    HomeCoordinatorView()
                        .tag(Tabs.home)
                    SettingsCoordinatorView()
                        .tag(Tabs.settings)
                }
                .toolbar(.hidden, for: .tabBar)
            }
            .tint(.red)
            VStack{
                Spacer()
                tabBar
            }
        }
    }
    
    private var tabBar : some View {
        HStack{
            Spacer()
            Button{
                withAnimation(.easeInOut) {
                    tabBarViewModel.animate.toggle()
                    tabBarViewModel.currentTab = .home
                    withAnimation(.easeInOut(duration: 0.8)) {
                        tabBarViewModel.rotationAngle = 360
                    }
                }
            } label: {
                VStack {
                    Image(systemName: "house.lodge.fill").resizable().scaledToFit().frame(width: 42)
                        .symbolEffect(.bounce.up.byLayer, value: tabBarViewModel.animate)
                    if tabBarViewModel.currentTab == .home {
                        Text(Tabs.home.rawValue).font(.system(size: 11))
                    }
                }
            }
            .foregroundStyle(tabBarViewModel.currentTab == .home ? Color.primary : Color.secondary)
            Spacer()
            Button {
                withAnimation(.easeInOut(duration: 0.6)) {
                    tabBarViewModel.isSettingsTabActive.toggle()

                    if tabBarViewModel.currentTab == .settings && tabBarViewModel.isSettingsTabActive {
                        tabBarViewModel.rotationAngle = 0
                    } else {
                        tabBarViewModel.rotationAngle = 180
                    }
                    
                    withAnimation {
                        tabBarViewModel.currentTab = .settings
                    }
                }
            } label: {
                VStack {
                    Image(systemName: "gearshape").resizable().scaledToFit().frame(width: 22)
                        .rotationEffect(.degrees(tabBarViewModel.rotationAngle))
                    if tabBarViewModel.currentTab == .settings {
                        Text(Tabs.settings.rawValue).font(.system(size: 11))
                    }
                }
            }
            .foregroundStyle(tabBarViewModel.currentTab == .settings ? Color.primary : Color.secondary)
            Spacer()
            
        }
        .frame(height: 72)
        .background{
            RoundedRectangle(cornerRadius: 35)
                .fill(RadialGradient(gradient: Gradient(colors: [Color.mainRedMain, .white]), center: .center, startRadius: 30, endRadius: 350))
                .shadow(color: .black.opacity(0.5), radius: 8, y: 2)
        }
        .padding(.horizontal, 10)
    }
}



#Preview {
    let preview = Preview(TeamModel.self, Card.self, TransactionItemDataModel.self, User.self)
    let teamModel = TeamModel.sampleTeamModel
    let card = Card.sampleCards
    let user = User.sampleUser
    let transactionItemDataModel = TransactionItemDataModel.sampleTransactionItemDataModel
    preview.addExamples(card)
    preview.addExamples(teamModel)
    preview.addExamples(user)  
    preview.addExamples(transactionItemDataModel)
    return TabBarView()
        .modelContainer(preview.container)
        .environmentObject(HomeCoordinator())
        .environmentObject(SettingsCoordinator())
        .environmentObject(SplashScreenViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(CreateTeamUserViewModel())
}

