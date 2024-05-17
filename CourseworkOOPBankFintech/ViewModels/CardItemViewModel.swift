//
//  CardListViewModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 18.04.2024.
//

import SwiftUI

final class CardItemViewModel : ObservableObject {
    @Published var itemWidth : CGFloat = 280
    @Published var spacing: CGFloat = -70
    @Published var rotation: CGFloat = UIScreen.main.bounds.width / 6.5
    @Published var enableReflection : Bool = true
}
