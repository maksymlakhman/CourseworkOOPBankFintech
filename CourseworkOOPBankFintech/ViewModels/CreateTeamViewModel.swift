//
//  AddTeamViewModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 19.04.2024.
//

import SwiftUI

final class CreateTeamViewModel : ObservableObject {
    @Published var teamNameTextTF : String = ""
    @Published var teamEmailTextTF : String = ""
    @Published var selectedRegion: TeamRegionCountry = .ukraine
    @Published var color : Color = Color.green
}
