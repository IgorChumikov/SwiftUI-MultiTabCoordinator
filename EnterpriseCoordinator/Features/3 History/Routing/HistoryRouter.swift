//
//  HistoryRouter.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct HistoryRouter: Router {
    let dependencies: HistoryDependencies
    let coordinator: NavigationCoordinator<HistoryRoute>

    @ViewBuilder
    func rootView() -> some View {
        HistoryView(coordinator: coordinator)
    }

    @ViewBuilder
    func view(for route: HistoryRoute) -> some View {
        switch route {
        case .documentDetails(document: let document):
            DocumentHistoryDetailsView(coordinator: coordinator, document: document)
        case .allDocumentsHistoryView(documentTitle: let documentTitle):
            AllDocumentsHistoryView(coordinator: coordinator, documentTitle: documentTitle)
        }
    }

    func makeEventHandler() -> (NavigationEvent<HistoryRoute>) -> Void {
        let analytics = dependencies.analytics
        return { event in
            switch event {
            case .pushed(let route):
                analytics.track("history.\(route.analyticsName)")
            case .presentedSheet(let sheet):
                analytics.track("history.modal.\(sheet.analyticsName)")
            case .presentedCover(let cover):
                analytics.track("history.modal.\(cover.analyticsName)")
            case .popped(let remaining):
                // Возврат к корню таба — отдельное событие. Промежуточные
                // возвраты не считаем: экран уже был засчитан при переходе
                // вперёд.
                if remaining == 0 {
                    analytics.track(AppTab.history.rootScreenEvent)
                }
            }
        }
    }
}
