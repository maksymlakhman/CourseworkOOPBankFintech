//
//  SplashScreenViewModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 18.04.2024.
//

import SwiftUI

final class SplashScreenViewModel : ObservableObject {
    @Published var isSwiped : Bool = false
    @Published var circleOffset: CGFloat = -300
    @Published var vStackHeight: CGFloat = 100
    @Published var animationIsActive : Bool = true
    private var buttonTitle: String {
        return animationIsActive ? "Stop animations" : "Start animations"
    }
}
