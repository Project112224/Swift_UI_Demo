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
                    case .homePage: HomeViewController().navigationBarTitle("行動輔銷平台", displayMode: .inline)
                    }
                }
                .navigationBarHidden(router.hiddenHeader)
            }
            .environmentObject(router)
        }
    }
}
