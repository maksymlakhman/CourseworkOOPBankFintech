//
//  SallaryView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 18.04.2024.
//

import SwiftUI

struct SalaryCalculatorView: View {
    
    @EnvironmentObject private var coordinator: HomeCoordinator
    @EnvironmentObject private var salaryCalculatorViewModel: SalaryCalculatorViewModel
    @Environment(\.modelContext) private var context


    @FocusState var sendIsFocused: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Калькулятор зарплати")) {
                        HStack {
                            TextField("Номер рахунку", text: $salaryCalculatorViewModel.accountNumber)
                                .keyboardType(.asciiCapableNumberPad)
                                .onChange(of: salaryCalculatorViewModel.accountNumber) { oldValue, newValue in
                                    let cleanedValue = newValue.replacingOccurrences(of: " ", with: "")
                                    if cleanedValue.count <= 16 {
                                        let formattedValue = salaryCalculatorViewModel.formatAccountNumber(cleanedValue)
                                        salaryCalculatorViewModel.accountNumber = formattedValue
                                    } else {
                                        salaryCalculatorViewModel.accountNumber = String(cleanedValue.prefix(16))
                                    }
                                }
                                .focused($sendIsFocused)
                        }
                        HStack {
                            TextField("Погодинна ставка", text: $salaryCalculatorViewModel.hourlyRate)
                                .keyboardType(.numberPad)
                                .focused($sendIsFocused)
                        }
                        
                        HStack {
                            TextField("Відпрацьовані години", text: $salaryCalculatorViewModel.hoursWorked)
                                .keyboardType(.numberPad)
                                .focused($sendIsFocused)
                        }
                        HStack {
                            TextField("Податкова ставка", text: Binding(
                                get: { salaryCalculatorViewModel.taxRate ?? "" },
                                set: { salaryCalculatorViewModel.taxRate = $0.isEmpty ? nil : $0 }
                            ))
                            .keyboardType(.numberPad)
                            .focused($sendIsFocused)
                        }
                        
                        HStack {
                            TextField("Бонуси", text: Binding(
                                get: { salaryCalculatorViewModel.bonuses ?? "" },
                                set: { salaryCalculatorViewModel.bonuses = $0.isEmpty ? nil : $0 }
                            ))
                            .keyboardType(.numberPad)
                            .focused($sendIsFocused)
                        }
                        
                        CustomTextEditor.init(placeholder: "Почни писати свій коментар..", text: $salaryCalculatorViewModel.comments)
                            .font(.body)
                            .accentColor(.red)
                            .frame(height: 200)
                            .cornerRadius(8)
                        
                    }
                    
                }
                .scrollIndicators(.hidden)
                .listRowSpacing(20)
                .foregroundColor(Color("MainTextAndForegroundIconColor"))
                
                Button {
                    salaryCalculatorViewModel.pushSalary(finalNetSalary: salaryCalculatorViewModel.finalNetSalary, comments: salaryCalculatorViewModel.comments, accountNumber: salaryCalculatorViewModel.accountNumber)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("MainTextAndForegroundIconColor"))
                        HStack {
                            Text("Кінцевий розрахунок ₴\(salaryCalculatorViewModel.finalNetSalary)")
                            Image(systemName: "arrowshape.bounce.forward")
                        }
                        .foregroundStyle(Color("MainBackgroundIconColor"))
                    }
                    .frame(maxHeight: 100)
                    .padding()
                }
                .onChange(of: [salaryCalculatorViewModel.hourlyRate, salaryCalculatorViewModel.hoursWorked, salaryCalculatorViewModel.taxRate, salaryCalculatorViewModel.bonuses]) { oldValue, newValue in
                    salaryCalculatorViewModel.createAndPushSalary()
                }
            }
            .navigationTitle("Калькулятор")
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    BackButton(coordinator: coordinator)
                }
            }
        }
        
        
    }
    


}

#Preview {
  let preview = Preview(Card.self)
  preview.addExamples(Card.sampleCards)
  return SalaryCalculatorView()
        .modelContainer(preview.container)
        .environmentObject(HomeCoordinator())
        .environmentObject(CardItemViewModel())
}

