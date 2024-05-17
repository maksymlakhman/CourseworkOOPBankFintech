//
//  HorisontalSVAllTeams.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 19.04.2024.
//

import SwiftUI

struct HorisontalSVAllTeams: View {
    
    @EnvironmentObject private var coordinator : HomeCoordinator
    
    var card : Card
    var teams : [TeamModel]
    
    var body: some View {
        HStack {
            TeamFlowView(items: teams) { team in
                Button {
                    coordinator.viewModel.selectedTeam = team
                    coordinator.push(.teamView)
                } label: {
                    TeamPanelView(team: team)
                }
            }
            Button(action: {
                coordinator.present(fullScreenCover: .addTeamView)
            }, label: {
                ZStack {
                    Capsule()
                        .strokeBorder(Color(card.hexColor), style: .init(lineWidth: 2.2, dash: [4.5]))
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16, alignment: .center)
                        .foregroundStyle(Color(card.hexColor))
                }
                .frame(maxWidth: 80, maxHeight: 180)
            })
        }
        .padding(.trailing, 20)
    }
}


struct TeamPanelView: View {
    @EnvironmentObject private var coordinator : HomeCoordinator
    var team: TeamModel
    @State private var scaleAnimationButton = true
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: 20, bottomTrailingRadius: 20, topTrailingRadius: 20)
                .fill(team.hexColor.opacity(1))
            VStack(alignment: .center) {
                if team.arrUsers?.isEmpty == true {
                    VStack{
                        HStack(spacing : 0) {
                            Text(team.teamName)
                                .padding(.vertical, 5)
                                .font(.system(size: 18, design: .rounded))
                                .fontWeight(.bold)
                            Text(team.region.description)
                                .font(.system(size: 10, design: .rounded))
                                .fontWeight(.bold)
                                .offset(y : -8)
                        }
                        Text("Наразі порожня")
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.mainTextAndForegroundIcon))
                            Text("Додати")
                                .foregroundStyle(Color(team.hexColor))
                        }
                        .padding(.top, 20)
                        .scaleEffect(scaleAnimationButton ? 0.8 : 0.7)
                        .onAppear() {
                            withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()) {
                                scaleAnimationButton.toggle()
                            }
                        }
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical ,20)
                } else {
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: -20){
                            if team.arrUsers?.count ?? 0 > 4{
                                ForEach(team.arrUsers?.prefix(3) ?? [], id: \.self) { user in
                                    ZStack {
                                        Circle()
                                            .fill(Color(user.hexColor))
                                            .frame(maxHeight: 50)
                                            .padding(.horizontal, 5)
                                        
                                        Text(String(user.name.first ?? " "))
                                            .padding(10)
                                            .font(.system(size: 12))
                                        
                                    }
                                    .padding(.top, 20)
                                }
                                Text("+\((team.arrUsers?.count ?? 0) - 3)")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50)
                                    .background(Color.gray)
                                    .clipShape(Circle())
                            } else {
                                ForEach(team.arrUsers?.prefix(4) ?? [], id: \.self) { user in
                                    ZStack {
                                        Circle()
                                            .fill(Color(user.hexColor))
                                            .frame(maxHeight: 50)
                                            .padding(.horizontal, 5)
                                        
                                        Text(String(user.name.first ?? " "))
                                            .padding(10)
                                            .font(.system(size: 12))
                                        
                                    }
                                    .padding(.top, 10)
                                }
                            }
                            
                        }
                    }
                    HStack(spacing: 0) {
                        Text(team.teamName)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .fontWeight(.bold)
                        Text(team.region.description)
                            .font(.system(size: 10, design: .rounded))
                            .fontWeight(.bold)
                            .offset(y : -8)
                    }
                    .padding()
                    Button(action: {
                        coordinator.present(sheet: .receiveSheetView)
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.mainTextAndForegroundIcon))
                            Text("Оплатити")
                                .padding(10)
                                .foregroundStyle(Color(team.hexColor))
                        }
                        .padding(.vertical ,20)
                        .padding(.horizontal ,10)
                    })
                    .buttonStyle(.borderless)
                }
                
                
            }
            .foregroundStyle(Color("MainTextAndForegroundIconColor"))
        }
    }
    
}

#Preview {
    let preview = Preview(TeamModel.self)
    let card = Card.sampleCards
    let teamModel = TeamModel.sampleTeamModel
    preview.addExamples(card)
    preview.addExamples(teamModel)
    return HorisontalSVAllTeams(card: card[0], teams: teamModel)
        .modelContainer(preview.container)
        .environmentObject(HomeCoordinator())
}




