//
//  DemoApp.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

@main
struct RoutingApp: App {
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                LoginView()
                .navigationDestination(for: PageName.self) { name in
                    switch name {
                    case .loginPage: LoginView()
                    case .homePage: HomeView()
                    }
                }
            }
            .environmentObject(router)
        }
    }
}
