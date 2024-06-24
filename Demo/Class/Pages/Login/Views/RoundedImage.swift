//
//  RoundedImage.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

struct RoundedImage: View {

    var body: some View {
        Image(ImageName.launchCubcLogoIcon)
           .resizable()
           .aspectRatio(contentMode: .fill)
           .frame(width: 150, height: 150)
           .clipped()
           .padding(.bottom, 40)
    }
}
