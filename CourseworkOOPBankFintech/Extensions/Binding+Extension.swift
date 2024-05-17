//
//  Binding+Extension.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 04.04.2024.
//

import SwiftUI


struct CoinTextField: View {
    @Binding var coins: Double?

    private var text: Binding<String> {
        Binding(
            get: {
                coins != nil ? String(format: "%.0f", coins!) : ""
            },
            set: { newValue in
                if newValue.isEmpty {
                    coins = nil
                } else if let value = Double(newValue) {
                    coins = value
                }
            }
        )
    }

    var body: some View {
        TextField("Зарахування*", text: text)
            .keyboardType(.numberPad)
    }
    
}

