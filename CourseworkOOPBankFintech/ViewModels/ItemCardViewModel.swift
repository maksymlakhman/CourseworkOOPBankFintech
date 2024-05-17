//
//  ItemCardViewModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 19.04.2024.
//

import Foundation

final class ItemCardViewModel: ObservableObject {
    func totalTransactionAmount(transactions : [TransactionItemDataModel]) -> Double {
        var totalAmount : Double = 0.0
        for transaction in transactions {
            totalAmount += transaction.userTransfers
        }
        return totalAmount
    }
}
