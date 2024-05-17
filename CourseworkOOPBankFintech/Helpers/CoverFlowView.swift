//
//  CoverFlowView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import SwiftUI

struct CoverFlowView<Content : View, Item : RandomAccessCollection>: View where Item.Element : Identifiable{
    var itemWidth : CGFloat
    var enableReflection : Bool = false
    var spacing : CGFloat = 0
    var rotation : Double
    var items : Item
    var content : (Item.Element) -> Content
    var body: some View {
        GeometryReader{
            let size = $0.size
            
            ScrollView(.horizontal){
                HStack(spacing : 0){
                    ForEach(items) { item in
                        content(item)
                            .frame(width: itemWidth)
                            .reflection(added: enableReflection)
                            .visualEffect { content, geometryProxy in
                                content
                                    .rotation3DEffect(.init(degrees: rotation(geometryProxy)), axis: (x: 0, y: 1, z: 0), anchor: .center)
                            }
                            .padding(.trailing, item.id == items.last?.id ? 0 : spacing)
                    }
                }
                .padding(.horizontal, (size.width - itemWidth) / 2)
                .scrollTargetLayout()
            }
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)
        .scrollClipDisabled()
    }
    
    func rotation(_ proxy : GeometryProxy) -> Double {
        let scrollViewWidth = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0
        let midX = proxy.frame(in: .scrollView(axis: .horizontal)).midX
        
        let progress = midX / scrollViewWidth
        let cappedProgress = max(min(progress, 1), 0)
        
        let cappedRotation = max(min(rotation, 90),0)
        
        let dergee = cappedProgress * (cappedRotation * 2)
        
        return cappedRotation - dergee
    }
}




fileprivate extension View {
    @ViewBuilder
    func reflection(added : Bool) -> some View {
        self.overlay {
            if added {
                GeometryReader{
                    let size = $0.size
                    self
                        .scaleEffect(y : -1)
                        .mask {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(colors: [.white, .white.opacity(0.7), .white.opacity(0.5), .white.opacity(0.3),
                                        .white.opacity(0.1),
                                                            .white.opacity(0),] + Array(repeating: Color.clear, count: 5), startPoint: .top, endPoint: .bottom))
                                .frame(width: UIScreen.main.bounds.width / 1.4)
                        }
                        .offset(y : size.height + 5)
                        .opacity(0.5)

                }
            }

        }
    }
    
}


