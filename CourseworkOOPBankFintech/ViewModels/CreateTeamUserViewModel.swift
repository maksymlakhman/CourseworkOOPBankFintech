//
//  UserAdditionTeamUserViewModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 18.04.2024.
//

import SwiftUI

final class CreateTeamUserViewModel : ObservableObject {
    @Published var userName : String = ""
    @Published var userLastName : String = ""
    @Published var color = Color.green
}
