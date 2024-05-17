//
//  Transaction.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 19.04.2024.
//

import SwiftUI

struct TransactionDetailsView: View {
    
    let transactionItemDataModel : TransactionItemDataModel
    
    var body: some View {
        VStack{
            Text(String(format: "-%.2f", transactionItemDataModel.userTransfers))
        }
    }
}


#Preview{
    let preview = Preview(TransactionItemDataModel.self)
    let transactionItemDataModel = TransactionItemDataModel.sampleTransactionItemDataModel
    preview.addExamples(transactionItemDataModel)
    return TransactionDetailsView(transactionItemDataModel: transactionItemDataModel[0])
        .modelContainer(preview.container)
}
