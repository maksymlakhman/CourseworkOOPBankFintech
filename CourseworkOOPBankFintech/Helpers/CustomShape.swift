//
//  CustomShape.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import SwiftUI

struct CustomShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width
            let height = rect.height
            let topCurveHeight: CGFloat = -250
            let curveWidth: CGFloat = 600
            path.move(to: CGPoint(x: width, y: 0))
            
            path.addLine(to: CGPoint(x: width, y: height / 2 - curveWidth / 2))
            path.addQuadCurve(to: CGPoint(x: width, y: height / 2 + curveWidth / 2),
                              control: CGPoint(x: width + topCurveHeight, y: height / 2))
            path.addQuadCurve(to: CGPoint(x: width / 2 + curveWidth / 2, y: height),
                              control: CGPoint(x: width + 500 , y: height + topCurveHeight + 900))
            
            path.addLine(to: CGPoint(x: width, y: height))
            

            path.addLine(to: CGPoint(x: 700, y: 700))
            

            path.addLine(to: CGPoint(x: 700, y: -800))
            

            path.addLine(to: CGPoint(x: width, y: -245))
            

            path.closeSubpath()
        }
    }
}




#Preview {
    SplashScreen()
}

