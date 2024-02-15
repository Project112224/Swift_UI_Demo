//
//  Title.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

struct Title: View {
    var body: some View {
        HStack(spacing: 0) {
            Image(ImageName.titleLogo)
                .resizable()
                .frame(
                    width: 154.38,
                    height: 28
                )
            Spacer()
            Rectangle()
                .frame(width: 1, height: 28)
                .foregroundColor(Color.gray)
            Spacer()
            Text("行動輔銷平台")
                .font(.system(size: 16, weight: .bold))
        }.frame(width: 279.38)
    }
}

#Preview {
    Title()
}
