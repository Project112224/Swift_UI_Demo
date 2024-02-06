//
//  LoginView.swift
//  Demo
//
//  Created by 高杉君 on 2024/2/6.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("**Go to HomePage**") {
                router.navigate(to: .homePage)
            }
            .padding(.top, 12)
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
