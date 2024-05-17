//
//  SplashScreen.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import SwiftUI

struct SplashScreen: View {
    @EnvironmentObject private var splashScreenViewModel : SplashScreenViewModel
    var body: some View {
        if splashScreenViewModel.isSwiped {
            withAnimation {
                TabBarView()
            }
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.darkRedMain, .mainRedMain, .lightRedMain, .lightRedMain]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    Text("Save your\n time & Less\n Expense")
                        .font(.system(size: 50, weight: .semibold, design: .serif))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                    Spacer()
                    ZStack(alignment: .trailing) {
                        VStack {
                            Image("person")
                                .resizable()
                                .scaledToFit()
                        }
                        .padding(.top, 40)
                        VStack {
                            VStack(spacing: 0) {
                                ZStack {
                                    Circle()
                                        .fill(.cyan)
                                        .frame(maxWidth: 100)
                                        .overlay {
                                            ZStack {
                                                Circle()
                                                    .fill(.pink)
                                                    .frame(maxWidth: 60)
                                                    .offset(x: 20, y: splashScreenViewModel.circleOffset)
                                            }
                                        }
                                        .overlay {
                                            Circle()
                                                .fill(.blue)
                                                .frame(maxWidth: 40)
                                                .offset(x: 20, y: splashScreenViewModel.circleOffset * -1)

                                        }
                                    VStack(alignment: .leading) {
                                        Text("swipe")
                                        HStack {
                                            Text("me")
                                            Image(systemName: "arrowshape.turn.up.right")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 22)
                                                .symbolEffect(
                                                    .pulse,
                                                    isActive: splashScreenViewModel.animationIsActive
                                                )
                                        }
                                    }
                                }
                            }
                            .padding(5)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        withAnimation {
                                            splashScreenViewModel.circleOffset = gesture.translation.width
                                        }
                                    }
                                    .onEnded { gesture in
                                        withAnimation(.bouncy) {
                                            if splashScreenViewModel.circleOffset < 150 {
                                                splashScreenViewModel.animationIsActive.toggle()
                                                splashScreenViewModel.isSwiped = true
                                                splashScreenViewModel.circleOffset = -300
                                                
                                            } else {
                                                splashScreenViewModel.isSwiped = false
                                                splashScreenViewModel.circleOffset = -300
                                            }
                                        }
                                    }
                            )
                            .foregroundColor(.white)
                            .background(
                                VStack(spacing: 0) {
                                    
                                    ZStack {
                                        Color("MainRedMainColor")
                                        VStack {
                                            Color("MainRedMainColor").clipShape(CustomShape()).rotationEffect(.init(degrees: 180))
                                        }
                                    }
                                }
                                .animation(.easeOut(duration: 1))
                            )
                            .offset(x: splashScreenViewModel.circleOffset)
                        }
                    }
                    Spacer()
                    Spacer()
                }
                VStack(alignment: .trailing) {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Best payment method,\n connects your money to\n your friends")
                            .font(.system(size: 19, weight: .medium, design: .serif))
                            .foregroundColor(.lightRedMain)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}


#Preview {
    SplashScreen()
        .environmentObject(SplashScreenViewModel())
}



