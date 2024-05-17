//
//  HeaderView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 18.04.2024.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        HStack{
            ZStack{
                Image("header_circle")
                    .resizable()
                    .scaledToFit()
                    .phaseAnimator([false, true]) { stack, chroma in
                        stack
                            .hueRotation(.degrees(chroma ? 420 : 0))
                    } animation: { chroma in
                            .easeInOut(duration : 10)
                    }
                    .clipShape(Circle())
                
                Image(userViewModel.user.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding(6)
                    
                    
            }
            .frame(width: 46, height: 46)
            
            
            Text("Hello, \(userViewModel.user.userName)!")
                            .font(.headline)
                            .foregroundColor(Color("MainTextAndForegroundIconColor"))
            
        }
    }
}

#Preview {
    HeaderView()
        .environmentObject(UserViewModel())
}
