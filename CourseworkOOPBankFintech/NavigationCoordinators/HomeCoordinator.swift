//
//  HomeCoordinator.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 06.03.2024.
//

import SwiftUI
//Опис стандартних навігаційних вью
//Також enum можна писати в різних рядках(або case з приставкою case до кожного view)
enum HomePage : String, Identifiable {
    case cardListView,
         cardList,
         updateHeaderView,
         createCardView,
         itemCardView,
         additionalFuncionalityCard,
         buttonDeleteCard,
         teamView,
         userView
    var id: String {
        self.rawValue
    }
}

//Також enum можна писати в одному рядку
enum HomeSheet : String, Identifiable {
    case addTeamUserSheet , receiveSheetView
    var id: String {
        self.rawValue
    }
}

enum HomeFullScreenCover : String, Identifiable {
    case extensionParametersCardView
    case salary
    case addTeamView
    var id : String {
        self.rawValue
    }
}


class HomeViewModel: ObservableObject {
    @Published var selectedCard: Card?
    @Published var selectedTeam: TeamModel?
    @Published var user: User?
    @Published var teamUsers: [User]?
    @Published var transactions: [TransactionItemDataModel]?
}



//Реализація навігації на tab - Home
class HomeCoordinator : ObservableObject, CoordinatorProtocol {
    @Published var path = NavigationPath()
    @Published var homeSheet : HomeSheet?
    @Published var homeFullScreenCover : HomeFullScreenCover?
    var viewModel: HomeViewModel = HomeViewModel()
    
    
    //показ вью
    func push(_ homePage : HomePage) {
        path.append(homePage)
    }
    
    func present(sheet homeSheet : HomeSheet) {
        self.homeSheet = homeSheet
    }
    
    func present(fullScreenCover homeFullScreenCover : HomeFullScreenCover) {
        self.homeFullScreenCover = homeFullScreenCover
    }
    //перехід на минулі view
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet(sheet: HomeSheet) {
        self.homeSheet = nil
    }
    
    func dismissFullScreenCover(fullScreenCover: HomeFullScreenCover) {
        self.homeFullScreenCover = nil
    }
    
    
    //Будуемо дерево навігації звичайних стадартних View
    @ViewBuilder
    func build(homePage: HomePage) -> some View {
        switch homePage {
        case .cardListView:
            CardListView()
        case .cardList:
            CardList()
        case .updateHeaderView:
            UpdateHeaderView()
        case .createCardView:
            CreateCardView()
        case .itemCardView:
            ItemCardView(
                selectedCard : viewModel.selectedCard ?? Card(
                    _color: "",
                    _name: "no name",
                    _coins: 0,
                    _creationDate: Date.now,
                    _expirationDate: Date.distantPast,
                    _tokenCode: 521,
                    _logoCard : .mastercard
                ),
                selectedArrayOfTransactions: viewModel.transactions ?? []
            )
        case .additionalFuncionalityCard:
            HomeItemAdditionalFunctionalityCard(
                selectedCard : viewModel.selectedCard ?? Card(
                    _color: "",
                    _name: "no name",
                    _coins: 0,
                    _creationDate: Date.now,
                    _expirationDate: Date.distantPast,
                    _tokenCode: 521,
                    _logoCard: .mastercard
                )
            )
        case .buttonDeleteCard:
            ButtonDeleteCard(
                card : viewModel.selectedCard ?? Card(
                    _color: "",
                    _name: "no name",
                    _coins: 0,
                    _creationDate: Date.now,
                    _expirationDate: Date.distantPast,
                    _tokenCode: 521,
                    _logoCard: .mastercard
                )
            )
        case .teamView:
            TeamView(
                team: viewModel.selectedTeam ?? TeamModel(
                    teamName: "",
                    teamEmail: "",
                    region: .ukraine,
                    color: ""
                ), card : viewModel.selectedCard ?? Card(
                    _color: "",
                    _name: "no name",
                    _coins: 0,
                    _creationDate: Date.now,
                    _expirationDate: Date.distantPast,
                    _tokenCode: 521,
                    _logoCard: .mastercard
                )
            )
        case .userView:
            UserView(user: viewModel.user ?? User(name: "", userLastName: "", color: ""))
        }
    }
    
    //Будуемо дерево навігації sheet
    @ViewBuilder
    func build(homeSheet: HomeSheet) -> some View {
        switch homeSheet {
        case .addTeamUserSheet:
            NavigationStack {
                CreateTeamUserSheetView(team: viewModel.selectedTeam ?? TeamModel(teamName: "", teamEmail: "", region: .ukraine, color: ""))
            }
            .presentationDetents([.medium])
        case .receiveSheetView:
            NavigationStack {
                ReceiveView(
                    card: viewModel.selectedCard ?? Card(
                        _color: "нет карті",
                        _name: "no name",
                        _coins: 0,
                        _creationDate: Date.now,
                        _expirationDate: Date.distantPast,
                        _tokenCode: 721,
                        _logoCard: .mastercard
                    )
                )
            }
        }
    }
    
    @ViewBuilder
    func build(homeFullScreenCover : HomeFullScreenCover) -> some View {
        switch homeFullScreenCover
        {
            
        case .extensionParametersCardView:
            ParametersCardView(
                card : viewModel.selectedCard ?? Card(
                    _color: "нет карті",
                    _name: "no name",
                    _coins: 0,
                    _creationDate: Date.now,
                    _expirationDate: Date.distantPast,
                    _tokenCode: 521,
                    _logoCard: .mastercard
                )
            )
            
        case .salary:
            SalaryCalculatorView()
            
        case .addTeamView:
            CreateTeamView(
                card : viewModel.selectedCard ?? Card(
                    _color: "нет карті",
                    _name: "no name",
                    _coins: 0,
                    _creationDate: Date.now,
                    _expirationDate: Date.distantPast,
                    _tokenCode: 521,
                    _logoCard: .mastercard
                )
            )
            
        }
    }
}
