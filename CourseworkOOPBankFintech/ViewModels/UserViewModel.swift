//
//  UserViewModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 26.04.2024.
//

import Foundation


class UserViewModel: ObservableObject {
    @Published var user: UserAccountModel

    init(user: UserAccountModel = UserAccountModel()) {
        self.user = user
    }
}
