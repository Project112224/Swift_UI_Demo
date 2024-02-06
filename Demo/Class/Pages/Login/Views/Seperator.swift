//
//  Seperator.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

struct Seperator: View {
    
    var color: Color
    
    var body: some View {
        VStack {
            Divider().background(color)
        }.padding()
            .frame(height: 1, alignment: .center)
    }
}
