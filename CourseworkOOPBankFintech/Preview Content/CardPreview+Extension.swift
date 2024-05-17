//
//  CardPreview+Extension.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 09.04.2024.
//

import Foundation


extension Card {
    static var sampleCards : [Card] {
        [
            Card(
                _color: "MainRedMainColor",
                _name: "1234567891234567",
                _coins: 20000.00,
                _creationDate : Date.now,
                _expirationDate: Date.distantPast,
                _tokenCode: 672, 
                _logoCard: .mastercard
            ) ,
            Card(
                _color: "MainRedMainColor",
                _name: "7654321987654321",
                _coins: 100000, 
                _creationDate : Date.now,
                _expirationDate: Date.distantPast,
                _tokenCode: 694, 
                _logoCard: .mastercard
            ) ,
            Card(
                _color: "MainRedMainColor",
                _name: "42434323423423",
                _coins: 10210000,
                _creationDate : Date.now,
                _expirationDate: Date.distantPast,
                _tokenCode: 694,
                _logoCard: .mastercard
            )
        ]
    }
}

extension TeamModel {
    static var sampleTeamModel : [TeamModel] {
        [
            TeamModel(teamName: "", teamEmail: "", region: .ukraine, color: "")
        ]
    }
}

extension User {
    static var sampleUser : [User] {
        [
            User(name: "Max", userLastName: "Lakhman", color: "MainRedMainColor"),
            User(name: "Dennis", userLastName: "Roodman", color: "MainRedMainColor")
        ]
    }
}

extension TransactionItemDataModel{
    static var sampleTransactionItemDataModel : [TransactionItemDataModel] {
        [
            TransactionItemDataModel(card: Card(
                _color: "MainRedMainColor",
                _name: "7654321987654321",
                _coins: 100000, 
                _creationDate : Date.now,
                _expirationDate: Date.distantPast,
                _tokenCode: 631,
                _logoCard: .mastercard
            ), defaultImage: "globe", operationOptionImage: .receive, currentTimeAndDate: Date.now, userTransfers: 2000.00),
            TransactionItemDataModel(card: Card(
                _color: "MainRedMainColor",
                _name: "7654321987654321",
                _coins: 100000,
                _creationDate : Date.now,
                _expirationDate: Date.distantPast,
                _tokenCode: 631, 
                _logoCard: .mastercard
            ), defaultImage: "globe", operationOptionImage: .receive, currentTimeAndDate: Date.now, userTransfers: 2000.00),
            TransactionItemDataModel(card: Card(
                _color: "MainRedMainColor",
                _name: "7654321987654321",
                _coins: 100000,
                _creationDate : Date.now,
                _expirationDate: Date.distantPast,
                _tokenCode: 631,
                _logoCard: .mastercard
            ), defaultImage: "globe", operationOptionImage: .receive, currentTimeAndDate: Date.now, userTransfers: 2000.00)
        ]
    }
}
