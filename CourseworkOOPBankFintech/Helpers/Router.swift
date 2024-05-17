//
//  Router.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 05.03.2024.
//

import Foundation
import SwiftUI

extension NavigationPath{
    mutating func popToRoot() {
        self = NavigationPath()
    }
}
