//
//  Coordinator.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 12.04.2024.
//

import Foundation

protocol CoordinatorProtocol: AnyObject {
    associatedtype PageType
    associatedtype SheetType
    associatedtype FullScreenCoverType

    func push(_ page: PageType)
    func present(sheet: SheetType)
    func present(fullScreenCover: FullScreenCoverType)
    func pop()
    func popToRoot()
    func dismissSheet(sheet: SheetType)
    func dismissFullScreenCover(fullScreenCover: FullScreenCoverType)
}
