//
//  MaxLengthTextFieldModifier.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 20.03.2024.
//

extension String {
    func insertingSeparator(every n: Int, separator: Character) -> String {
        var result: [Character] = []
        var count = 0
        
        for char in self {
            if count == n {
                result.append(separator)
                count = 0
            }
            result.append(char)
            count += 1
        }
        
        return String(result)
    }
}


