//
//  Seperator.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

struct Seperator: View {
    
    var body: some View {
        VStack {
            Divider().background(Colors.green500)
        }.padding()
            .frame(height: 1, alignment: .center)
    }
}
