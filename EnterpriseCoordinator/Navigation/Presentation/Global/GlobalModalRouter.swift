//
//  GlobalModalRouter.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import SwiftUI

struct GlobalModalRouter {
    let dependencies: ModalDependencies

    @ViewBuilder
    func view(for sheet: GlobalSheet) -> some View {
        switch sheet {
        case .onboarding:
            OnboardingView()
        }
    }

    @ViewBuilder
    func view(for cover: GlobalCover) -> some View {
        switch cover {
        case .login:
            LoginView(authService: dependencies.authService)
        }
    }
}
