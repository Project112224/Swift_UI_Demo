//
//  ButtonWithBackground.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

struct ButtonWithBackground: View {
    
    var btnText: String
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text(btnText)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Colors.green500)
                    .clipped()
                    .cornerRadius(50.0)
            }
        }
    }
}

#Preview {
    ButtonWithBackground(btnText: "test")
}
