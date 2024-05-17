//
//  ExtensionParametersCardView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 01.03.2024.
//

import SwiftUI

struct ParametersCardView: View {
    @EnvironmentObject private var coordinator : HomeCoordinator
    @Environment(\.modelContext) private var context
    
    @State private var confirmDeletingCard = false
    @State private var animationIsActive = true

    var card: Card
    
    private var buttonTitle: String {
        return animationIsActive ? "Stop animations" : "Start animations"
    }

    private var formattedExpirationDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/yy"
        
        return formatter.string(from: card.expirationDate)
    }

    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                BackButton(coordinator: coordinator)
                Spacer()
            }
            .padding()
            VStack(spacing: 5) {
                HStack(spacing: 5) {
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: 20, bottomTrailingRadius: 150, topTrailingRadius: 150, style: .continuous)
                                .fill(card.hexColor)
                                .frame(maxWidth: 200, maxHeight: 100)
                            Text("Підписки")
                                .foregroundStyle(Color(.mainTextAndForegroundIcon))
                                .fontWeight(.semibold)
                        }
                    })
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(card.hexColor)
                                .frame(maxWidth: 150, maxHeight: 100)
                            Text("Масштабування")
                                .foregroundStyle(Color(.mainTextAndForegroundIcon))
                                .fontWeight(.semibold)
                        }
                    })
                    
                }
                Button(action: {
                    
                }, label: {
                    ZStack {
                        Capsule()
                            .fill(card.hexColor)
                            .frame(maxHeight: 100)
                        Text("Оновлення")
                            .foregroundStyle(Color(.mainTextAndForegroundIcon))
                            .fontWeight(.semibold)
                    }
                })
                .padding(.horizontal, 20)
                HStack(spacing: 5) {
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: 20, bottomTrailingRadius: 100, topTrailingRadius: 20, style: .continuous)
                                .fill(card.hexColor)
                                .frame(maxWidth: 200, maxHeight: 280)
                            Text("Інтеграції")
                                .foregroundStyle(Color(.mainTextAndForegroundIcon))
                                .fontWeight(.semibold)
                        }
                    })
                    VStack(spacing: 5) {
                        Button(action: {
                            
                        }, label: {
                            ZStack {
                                Circle()
                                    .fill(card.hexColor)
                                    .frame(maxWidth: 150, maxHeight: 150)
                                Text("Сервіси")
                                    .foregroundStyle(Color(.mainTextAndForegroundIcon))
                                    .fontWeight(.semibold)
                            }
                        })
                        Button(action: {
                            
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(card.hexColor)
                                    .frame(maxWidth: 150, maxHeight: 150)
                                Text("Заблокувати")
                                    .foregroundStyle(Color(.mainTextAndForegroundIcon))
                                    .fontWeight(.semibold)
                            }
                        })
                    }
                }
                
            }
            
            Spacer()

            Button(action: {
                confirmDeletingCard.toggle()
            }, label: {
                ZStack {
                    Capsule()
                        .fill(card.hexColor)
                        .frame(maxHeight: 70)
                    Text("Видалити картку")
                        .foregroundStyle(Color(.mainTextAndForegroundIcon))
                        .fontWeight(.semibold)
                }
            })
            .padding()
            .confirmationDialog("Are you sure?", isPresented: $confirmDeletingCard) {
                Button {
                } label: {
                    Label("Більше інформації", systemImage: "questionmark.circle")
                }
                Button("Видалити картку", role: .destructive) {
                    context.delete(card)
                    coordinator.dismissFullScreenCover(fullScreenCover: .extensionParametersCardView)
                    coordinator.popToRoot()
                }
            }
        }

    }
}

#Preview {
    let preview = Preview(Card.self)
    let card = Card.sampleCards
    preview.addExamples(card)
    return ParametersCardView(card: card[0])
        .modelContainer(preview.container)
        .environmentObject(HomeCoordinator())
}

