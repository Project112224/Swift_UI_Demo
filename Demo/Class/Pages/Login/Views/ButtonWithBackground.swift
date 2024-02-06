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
        
        HStack {
            Text(btnText)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 140, height: 50)
                .background(Colors.lightblueColor)
                .clipped()
                .cornerRadius(5.0)
                .shadow(color: Colors.lightblueColor, radius: 5, x: 0, y: 5)
        }
    }
}
