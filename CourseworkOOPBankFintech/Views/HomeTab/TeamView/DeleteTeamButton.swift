//
//  DeleteTeamButton.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 19.04.2024.
//

import SwiftUI

struct DeleteTeamButton: View {
    @State private var confirmDeletingTeam = false
    @Environment(\.modelContext) private var context
    @EnvironmentObject private var coordinator: HomeCoordinator
    @Bindable var team: TeamModel
    var body: some View {
        Button(action: {
            confirmDeletingTeam.toggle()
        }, label: {
            ZStack {
                Circle()
                    .fill(Color.gray)
                
                Image(systemName: "trash.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16, alignment: .center)
                    .padding(14)
                    .foregroundStyle(Color.mainBackgroundIcon)
            }
            .frame(width: 20, height: 20, alignment: .center)
        })
        .confirmationDialog("Уверены?", isPresented: $confirmDeletingTeam) {
            Button {
            } label: {
                Label("Подробнее", systemImage: "questionmark.circle")
                    .imageScale(.large)
            }
            Button("Удалить команду", role: .destructive) {
                context.delete(team)
                coordinator.pop()
            }
        }
        .padding()
    }
}

#Preview {
    let preview = Preview(TeamModel.self)
    let teamModel = TeamModel.sampleTeamModel
    preview.addExamples(teamModel)
    return DeleteTeamButton(team: teamModel[0])
        .modelContainer(preview.container)
        .environmentObject(HomeCoordinator())
}
