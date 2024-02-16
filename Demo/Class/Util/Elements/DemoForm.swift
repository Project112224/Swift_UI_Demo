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
            backgroundColor
                  .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                  )
                  .border(Colors.grayBorder, width: 1)
            VStack {
                content
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
        }
    }
}

#Preview {
    DemoForm(backgroundColor: .white) {
        Text("test")
    }
}
