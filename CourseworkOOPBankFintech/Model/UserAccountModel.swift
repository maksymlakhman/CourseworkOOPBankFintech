//
//  UserModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 06.03.2024.
//

import SwiftUI


struct UserAccountModel {
    var image: String = "3dPerson"
    var userName: String

    var userHeader: String {
        get { return userName }
        set { userName = newValue }
    }

    init(image: String = "3dPerson", userName: String = "Max") {
        self.image = image
        self.userName = userName
    }
}




