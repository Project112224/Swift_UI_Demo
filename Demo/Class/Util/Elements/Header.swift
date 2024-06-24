//
//  Header.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack(spacing: 0) {
            Image(ImageName.launchCubcLogoIcon)
                .resizable()
                .frame(
                    width: 28,
                    height: 28
                )
            Spacer()
                .frame(width: 10)
            Rectangle()
                .frame(width: 1, height: 28)
                .foregroundColor(Color.gray)
            Spacer()
                .frame(width: 10)
            Text("行動輔銷平台")
                .font(.system(size: 16, weight: .bold))
        }
    }
}

#Preview {
    Header()
}
