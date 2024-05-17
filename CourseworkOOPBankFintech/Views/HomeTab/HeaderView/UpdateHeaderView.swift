//
//  UpdateHeaderView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 04.03.2024.
//

import SwiftUI

struct UpdateHeaderView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var coordinator: HomeCoordinator
    
    // Временное хранилище значения имени пользователя
    @State private var tempUserName: String = ""

    var body: some View {
        HStack {
            Image(userViewModel.user.image)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            TextField("Имя", text: $tempUserName)
                .onChange(of: tempUserName) { oldValue, newValue in
                    userViewModel.user.userName = newValue
                }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            // Сохранение текущего имени пользователя при появлении представления
            tempUserName = userViewModel.user.userName
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                // Используйте onTapGesture для обработки нажатия на кнопку назад
                BackButton(coordinator: coordinator)
            }
            ToolbarItem(placement: .topBarTrailing) {
                // Используйте onTapGesture для обработки нажатия на кнопку сохранения изменений
                Button {
                    userViewModel.user.userName = tempUserName
                    coordinator.pop()
                } label: {
                    Image(systemName: "square.and.arrow.up.fill")
                }
            }
        }
        .onDisappear {
            userViewModel.user.userName = tempUserName
        }
    }
}


#Preview {
  UpdateHeaderView()
        .environmentObject(UserViewModel())
        .environmentObject(HomeCoordinator())
}





        


