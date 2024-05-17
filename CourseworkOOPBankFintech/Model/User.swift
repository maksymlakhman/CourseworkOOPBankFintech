//
//  User.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 09.03.2024.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class User {
    var name : String
    var userLastName : String
    var color: String
    var teamModel : [TeamModel]?
    
    init(name: String, userLastName : String, color : String) {
        self.name = name
        self.userLastName = userLastName
        self.color = color
    }
    
    var hexColor: Color {
        Color(hex: self.color) ?? .blue
    }
}
