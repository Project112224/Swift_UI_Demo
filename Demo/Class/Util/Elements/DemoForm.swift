//
//  DemoForm.swift
//  Demo
//
//  Created by --- on 2024/2/16.
//

import SwiftUI

struct DemoForm<Content: View>: View {
    
    @State var backgroundColor: Color = .white
    @ViewBuilder let content: Content
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                content
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
        }
        .border(Colors.grayBorder, width: 1)
        .background(backgroundColor)
    }
}

#Preview {
    DemoForm(backgroundColor: .white) {
        Text("test")
    }
}
