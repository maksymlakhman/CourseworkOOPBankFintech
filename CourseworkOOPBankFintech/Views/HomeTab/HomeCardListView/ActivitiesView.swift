//
//  ActivitiesView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 18.04.2024.
//

import SwiftUI

struct ActivitiesView: View {
    
    @EnvironmentObject private var coordinator: HomeCoordinator
    
    let arrImages : [String] = ["1", "2", "3", "4", "3dPerson"]
    var cards: [Card]

    var body: some View {
        VStack {
            HStack(){
                Text("Activites")
                Spacer()
            }.padding(.leading, 25).font(.system(size: 20, weight: .semibold, design: .serif)).foregroundColor(Color("MainTextAndForegroundIconColor"))
            HStack(spacing: 8){
                VStack{
                    lastActivities(arrUsers: arrImages)
                    
                    HStack(spacing: 5){
                        defaultSystemIntergationCompanies(image: "payoneer", nameCorporation: "Payoneer")
                            
                        defaultSystemIntergationCompanies(image: "paypal", nameCorporation: "PayPal")
                    }
                }
                
                Button(action: {
                    coordinator.present(fullScreenCover: .salary)
                }, label: {
                    payrollCalculation()
                })
                
                
            }
            .frame(maxHeight: 250)
            .padding(.horizontal, 10)
        }
    }
    
    func lastActivities(arrUsers : [String]) -> some View{
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("MainBackgroundIconColor"))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Send Again")
                        .font(.system(size: 15, weight: .semibold, design: .rounded)).padding(.bottom, 10)
                        .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                    Spacer()
                }
                
                HStack(spacing: -10) {
                    if arrUsers.count > 4 {
                        ForEach(arrUsers.prefix(3), id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                        }
                        Text("+\(arrUsers.count - 3)")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .frame(width: 45, height: 45)
                            .background(Color.gray)
                            .clipShape(Circle())
                    } else {
                        ForEach(arrUsers.prefix(4), id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                        }
                    }
                }
            }.padding(.leading, 15)
        }
    }
    
    func defaultSystemIntergationCompanies(image : String, nameCorporation : String) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("MainBackgroundIconColor"))
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 60)
                    
                Text(nameCorporation)
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(Color("MainTextAndForegroundIconColor"))
            }
        }
    }
    
    func payrollCalculation() -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("MainBackgroundIconColor"))
            VStack {
                Image(systemName: "banknote.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(5)
                    .frame(maxWidth: 60)
                    .padding(25)
                    .background(Color("FirstBackgroundColor"))
                    .clipShape(Circle())
                
                Text("Розрахуємо заробітну плату?")
                    .multilineTextAlignment(.center)
            }


        }
        .foregroundColor(Color("MainTextAndForegroundIconColor"))
    }
}

#Preview {
    let preview = Preview(Card.self)
    let cards = Card.sampleCards
    preview.addExamples(Card.sampleCards)
    return ActivitiesView(cards: cards)
        .modelContainer(preview.container)
        .environmentObject(CardItemViewModel())
}
