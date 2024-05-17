//
//  CreateCardViewModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 18.04.2024.
//

import SwiftUI

final class CreateCardViewModel: ObservableObject {
    @Published var color: Color = .blue
    @Published var name: String = ""
    @Published var coins: Double?
    @Published var showEmptyFieldsWarning: Bool = false
    @Published var showAYouSureWarning: Bool = false
    @Published var creationDate = Date.now
    @Published var expirationDate = Date.distantPast
    @Published var selectedLogo: LogoCard = .mastercard

    func validateFields() -> Bool {
        if name.isEmpty || (coins ?? 0) <= 0 {
            showEmptyFieldsWarning = true
            return false
        } else if name.count != 16 {
            showAYouSureWarning = true
            return false
        } else {
            return true
        }
    }

    func limitTextFieldInput(to limit: Int, newValue: inout String) {
      if newValue.count > limit {
        newValue = String(newValue.prefix(limit))
      }
    }
}
