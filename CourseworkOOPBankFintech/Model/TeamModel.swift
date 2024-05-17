//
//  TeamModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import SwiftUI
import SwiftData


enum TeamRegionCountry : String, Codable {
    case ukraine = "Ukraine"
    case usa = "USA"
    case uk = "UK"
    
    var description: String {
        switch self {
            case .ukraine: return "🇺🇦"
            case .usa: return "🇺🇸"
            case .uk: return "🇬🇧"
        }
    }
}

@Model
class TeamModel {
    var id : UUID
    var card : [Card]?
    var teamName : String
    var teamEmail : String
    var region : TeamRegionCountry
    var color: String
    @Relationship
    var arrUsers: [User]?
    
    init(teamName: String, teamEmail: String, region: TeamRegionCountry, color: String) {
        self.id = UUID()
        self.teamName = teamName
        self.teamEmail = teamEmail
        self.region = region
        self.color = color
    }
    
    var hexColor: Color {
        Color(hex: self.color) ?? .red
    }
}
