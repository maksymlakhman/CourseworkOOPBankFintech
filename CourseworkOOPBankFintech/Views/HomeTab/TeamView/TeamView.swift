//
//  TeamView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 07.03.2024.
//

import SwiftUI
import SwiftData

struct TeamView: View {
    @Query(sort: \User.name) var teamUsers: [User]
    @Environment(\.modelContext) private var context
    @EnvironmentObject private var coordinator: HomeCoordinator
    
    @Bindable var team: TeamModel
    var card : Card
   
    
    var body: some View {
        VStack {
            ListUsers(team: team, card: card, teamUsers: teamUsers)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(team.teamName)
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                BackButton(coordinator: coordinator)
            }
            ToolbarItem(placement: .topBarTrailing) {
                DeleteTeamButton(team: team)
            }
        } 
    }
}

#Preview {
    let preview = Preview(TeamModel.self, Card.self)
    let teamModel = TeamModel.sampleTeamModel
    let cards = Card.sampleCards
    let users = User.sampleUser
    preview.addExamples(cards)
    preview.addExamples(teamModel)
    preview.addExamples(users)
    return TeamView(team: teamModel[0], card: cards[1])
        .modelContainer(preview.container)
        .environmentObject(HomeCoordinator())
}
