//
//  TransactionItemDataModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 19.03.2024.
//

import SwiftUI
import SwiftData

enum SendOrReceivedEnum : String, Codable {
    case send = "arrow.up.forward"
    case receive = "arrow.down.backward"
    
    var description: String {
        switch self {
            case .send: return "Отправить"
            case .receive: return "Получить"
        }
    }
}

@Model
class TransactionItemDataModel: Identifiable, ObservableObject {
    var id : UUID
    var card : Card?
    var defaultImage : String
    var operationOptionImage : SendOrReceivedEnum
    var currentTimeAndDate : Date
    var userTransfers : Double
    
    init(card : Card ,defaultImage: String, operationOptionImage: SendOrReceivedEnum, currentTimeAndDate: Date, userTransfers: Double) {
        self.id = UUID()
        self.card = card
        self.defaultImage = defaultImage
        self.operationOptionImage = operationOptionImage
        self.currentTimeAndDate = currentTimeAndDate
        self.userTransfers = userTransfers
    }
    
}
