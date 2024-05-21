//
//  Card.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import SwiftUI
import SwiftData

enum LogoCard : String, Codable {
    case mastercard = "mastercard"
    case visa = "visa"
    case mono = "mono"
    
    var description : String {
        switch self{
        case .mastercard : "Mastercard"
        case .visa : "Visa"
        case .mono : "Monobank"
        }
    }
}

@Model
class Card {
    var color: String
    var name : String
    var coins : Double
    var transactionItemsDataModel : [TransactionItemDataModel]?
    var creationDate : Date
    var expirationDate : Date
    let tokenCode : Int
    var logoCard : LogoCard
    @Relationship(inverse : \TeamModel.teamName)
    
    
    init(_color: String, _name: String, _coins: Double, _creationDate : Date ,_expirationDate : Date, _tokenCode : Int, _logoCard : LogoCard) {
        self.color = _color
        self.name = _name
        self.coins = _coins
        self.creationDate = _creationDate
        self.expirationDate = Calendar.current.date(byAdding: .year, value: 4, to: Date()) ?? Date()
        self.tokenCode = Int.random(in: 100...999)
        self.logoCard = _logoCard
    }
    
    
    
    var hexColor: Color {
        Color(hex: self.color) ?? .red
    }
}





class CardsViewModel: ObservableObject {
    @Published var cards: [Card] = []
}




