//
//  UserView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 17.04.2024.
//

import SwiftUI

struct UserView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject private var coordinator: HomeCoordinator
    @Bindable var user : User
    
    var body: some View {
        VStack{
            Text(user.name)
            Text(user.userLastName)
                
        }
        .foregroundStyle(.mainTextAndForegroundIcon)
    }
}

#Preview {
    let preview = Preview(User.self)
    let user = User.sampleUser
    preview.addExamples(user)
    return UserView(user: user[1])
        .modelContainer(preview.container)
        .environmentObject(HomeCoordinator())
}
