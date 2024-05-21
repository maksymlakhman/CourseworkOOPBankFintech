////
////  NewCardView.swift
////  KursovaOOPV2.0
////
////  Created by Макс Лахман on 29.02.2024.
////
//
import SwiftUI

struct CreateCardView: View {

    @Environment(\.modelContext) private var context
    @EnvironmentObject private var coordinator : HomeCoordinator
    @EnvironmentObject private var сreateCardViewModel : CreateCardViewModel

    var body: some View {
        VStack {
            VStack {
                Form {
                    VStack(alignment: .center) {
                        Text("Створити віртуальний рахунок")
                            .fontWeight(.bold)
                        Picker("Оберіть логотип", selection: $сreateCardViewModel.selectedLogo) {
                            HStack {
                                Image(.mastercard)
                                    .resizable()
                                    .scaledToFit()
                                Text(LogoCard.mastercard.description)
                            }
                            .tag(LogoCard.mastercard)
                            HStack {
                                Image(.visa)
                                    .resizable()
                                    .scaledToFit()
                                Text(LogoCard.visa.description)
                            }
                            .tag(LogoCard.visa)                           
                            HStack {
                                Image(.mono)
                                    .resizable()
                                    .scaledToFit()
                                Text(LogoCard.mono.description)
                            }
                            .tag(LogoCard.mono)
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(height: 120)


                        TextField("Номер рахунку*", text: $сreateCardViewModel.name)
                            .keyboardType(.numberPad)
                            .onChange(of: сreateCardViewModel.name) { _, newValue in
                                let stripped = newValue.replacingOccurrences(of: " ", with: "")
                                сreateCardViewModel.name = stripped.insertingSeparator(every: 4, separator: " ")
                                сreateCardViewModel.limitTextFieldInput(to: 20, newValue: &сreateCardViewModel.name)
                                сreateCardViewModel.showEmptyFieldsWarning = false
                                сreateCardViewModel.showAYouSureWarning = false
                        }
                        if сreateCardViewModel.showAYouSureWarning {
                            withAnimation(.spring) {
                                Text("Не повний номер рахунку")
                                    .foregroundColor(.red)
                                    .padding(.top, 10)
                                    .font(.footnote)
                            }
                            
                        }
                    }
                    CoinTextField(coins: $сreateCardViewModel.coins)
                    
                    ColorPicker("Оберіть колір картки", selection: $сreateCardViewModel.color, supportsOpacity: false)
                }
                
            }
            
            if сreateCardViewModel.showEmptyFieldsWarning {
                withAnimation(.spring) {
                    Text("Будь-ласка заповніть всі поля")
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
            }
            Button {
                let strippedName = сreateCardViewModel.name.replacingOccurrences(of: " ", with: "")
                if strippedName.count != 16 {
                    сreateCardViewModel.showAYouSureWarning = true
                }
                if strippedName.count == 16 && сreateCardViewModel.coins ?? 0 > 0 {
                    let newCard = Card(_color: сreateCardViewModel.color.toHexString()!, _name: сreateCardViewModel.name, _coins: сreateCardViewModel.coins ?? 0, _creationDate: сreateCardViewModel.creationDate, _expirationDate: сreateCardViewModel.expirationDate, _tokenCode: Int.random(in: 100...999), _logoCard: сreateCardViewModel.selectedLogo)
                    context.insert(newCard)
                    coordinator.pop()
                    сreateCardViewModel.name = ""
                    сreateCardViewModel.coins = nil
                } else {
                    сreateCardViewModel.showEmptyFieldsWarning = true
                }
            } label: {
                if сreateCardViewModel.name.isEmpty || сreateCardViewModel.coins == 0 {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray)
                        Text("Створити рахунок")
                            .foregroundColor(.secondary)
                    }.padding(.horizontal)
                        .frame(minHeight: 50, maxHeight: 70)
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.mainRedMain)
                        Text("Створити рахунок")
                            .foregroundColor(.secondary)
                    }.padding(.horizontal)
                        .frame(minHeight: 50, maxHeight: 70)
                }
                
            }
            .padding(.bottom, 100)
        }
        .navigationTitle("New 💳")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    сreateCardViewModel.name = ""
                    сreateCardViewModel.coins = nil
                    coordinator.pop()
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.gray)

                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16, alignment: .center)
                            .padding(14)
                            .foregroundColor(Color("MainBackgroundIconColor"))
                    }
                    .frame(width: 20, height: 20, alignment: .center)
                    .padding(.leading, 10)
                }
                
            }
        }
    }

}



#Preview {
    CreateCardView()
        .modelContainer(for: Card.self)
        .environmentObject(HomeCoordinator())
        .environmentObject(CreateCardViewModel())
}

