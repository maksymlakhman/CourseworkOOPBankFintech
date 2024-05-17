//
//  TeamFlowView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 12.04.2024.
//

import SwiftUI


struct TeamFlowView<Content: View, Item: RandomAccessCollection>: View where Item.Element == TeamModel {
    var items : Item
    var content : (Item.Element) -> Content
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(items) { item in
                            content(item)
                                .padding(.leading, 20)
                                .padding(.trailing, 25)
                                .frame(width: geometry.size.width)
                                .visualEffect { content, geometryProxy in
                                    content
                                        .scaleEffect(scale(geometryProxy, scale: 0.1), anchor: .trailing)
                                        .rotationEffect(rotation(geometryProxy, rotation: 4))
                                        .offset(x: minX(geometryProxy))
                                        .offset(x : exessMinX(geometryProxy, offset: 4))
                                }
                                .zIndex(Array(items).zIndex(item))
                            
                        }
                    }
                    .padding(.vertical, 15)
                }
                .scrollTargetBehavior(.paging)
            }
            
        }
    }
    
    
    
    func minX(_ proxy : GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        return minX < 0 ? 0 : -minX
    }
    
    func progress(_ proxy : GeometryProxy, limit : CGFloat = 2) -> CGFloat {
        let maxX = proxy.frame(in: .scrollView(axis: .horizontal)).maxX
        let width = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0
        let progress = (maxX / width) - 1.0
        let cappedProgress = min(progress, limit)
        return cappedProgress
    }
    
    func scale(_ proxy : GeometryProxy, scale : CGFloat = 0.1) -> CGFloat{
        let progress = progress(proxy)
        return 1 - (progress * scale)
    }
    
    func exessMinX(_ proxy: GeometryProxy, offset : CGFloat = 10) -> CGFloat{
        let progress = progress(proxy)
        
        return progress * offset
    }
    
    func rotation(_ proxy: GeometryProxy, rotation : CGFloat = 5) -> Angle {
        let progress = progress(proxy)
        
        return .init(degrees: progress * rotation)
    }
}


extension Array where Element == TeamModel {
    func zIndex(_ item: TeamModel) -> CGFloat {
        if let index = firstIndex(where: { $0.id == item.id }) {
            return CGFloat(count) - CGFloat(index)
        }
        return 0 
    }
}



fileprivate extension View {
    @ViewBuilder
    func reflection(added: Bool) -> some View {
        self.overlay {
            if added {
                GeometryReader { geometry in
                    let size = geometry.size
                    self
                        .scaleEffect(y: 1)
                        .mask {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(colors: [.white, .white.opacity(0.7), .white.opacity(0.5), .white.opacity(0.3),
                                                            .white.opacity(0.1),
                                                            .white.opacity(0),] + Array(repeating: Color.clear, count: 5), startPoint: .center, endPoint: .bottomLeading))
                                .frame(width: UIScreen.main.bounds.height / 1.4)
                        }
                        .offset(x: size.width - 410)
                        .rotation3DEffect(.init(degrees: 50), axis: (x: 1, y: 0, z: 0), anchor: .leading)
                        .opacity(0.5)
                    
                }
            } else {
                EmptyView()
            }
        }
    }
    
}

