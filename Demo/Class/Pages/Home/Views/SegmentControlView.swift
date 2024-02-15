//
//  SegmentControlView.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import SwiftUI

struct SegmentControlView: View {
    
    @State private var selectorIndex = 0
    private var items = ["我的約訪","代辦事項"]
    
    init(items: [String] = ["我的約訪","代辦事項"]) {
        self.items = items
    }
    
    var body: some View {
        
        ZStack {
            /*
            RoundedRectangle(cornerRadius: 50)
                           .frame(width: 200, height: 38)
                           .foregroundColor(.black)
            */
            Picker("Numbers", selection: $selectorIndex) {
                ForEach(0..<self.items.count, id: \.self) { index in
                    Text(self.items[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 200, height: 38)
            //.cornerRadius(50)
            //.foregroundColor(Color.white)
            //.background(RoundedRectangle(cornerRadius: 50).fill(Color.black))

        }
        .padding()
        
    }
}

#Preview {
    SegmentControlView()
}

extension UISegmentedControl {
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setContentHuggingPriority(.defaultLow, for: .vertical)  // << here !!
    }
}

