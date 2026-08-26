//
//  NavigationCoordinator.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI
import Combine

// MARK: - NavigationCoordinator

final class NavigationCoordinator<RouteType: Route>: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published var path = NavigationPath() {
        didSet {
            // Уменьшение стека ловим здесь, а не в `pop()`: системная кнопка
            // «назад» и свайп меняют `path` через биндинг напрямую, минуя
            // методы координатора. Рост стека обрабатывает `push(_:)` —
            // только он знает, какой именно маршрут добавлен.
            guard path.count < oldValue.count else { return }
            onEvent?(.popped(remaining: path.count))
        }
    }
    
    // MARK: - Local Presentation
    
    @Published var localSheet: LocalSheet?
    @Published var localCover: LocalCover?

    // MARK: - Events

    /// Подписчик на навигационные события. Ставится в composition root.
    /// Координатор не знает, кто и зачем слушает, — он только сообщает факт.
    ///
    /// Замыкание не должно захватывать сам координатор: иначе получится цикл
    /// (координатор -> замыкание -> координатор) и окно на iPad не освободится
    /// при закрытии.
    var onEvent: ((NavigationEvent<RouteType>) -> Void)?
    
    // MARK: - Navigation
    
    func push(_ route: RouteType) {
        path.append(route)
        onEvent?(.pushed(route))
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        guard !path.isEmpty else { return }
        path.removeLast(path.count)
    }
    
    // MARK: - Sheet Presentation
    
    func showLocalSheet(_ localSheet: LocalSheet) {
        self.localSheet = localSheet
        onEvent?(.presentedSheet(localSheet))
    }
    
    func dismissLocalSheet() {
        localSheet = nil
    }
    
    // MARK: - Full Screen Cover Presentation
    
    func showLocalCover(_ localCover: LocalCover) {
        self.localCover = localCover
        onEvent?(.presentedCover(localCover))
    }
    
    func dismissLocalCover() {
        localCover = nil
    }
}
