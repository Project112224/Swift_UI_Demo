//
//  Router.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

final class Router: ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    func navigate(to name: PageName) {
        navPath.append(name)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
