//
//  PickerControlView.swift
//  Demo
//
//  Created by Brook on 2024/2/7.
//

import SwiftUI

struct PickerControlView: View {
    
    var items = ["1個月", "3個月", "6個月", "9個月", "12個月"]
    @State private var selecteItem = 0
    
    var body: some View {
        
        Picker(selection: $selecteItem, label: Text("")) {
            ForEach(0 ..< items.count, id: \.self) {
                Text(items[$0])
            }
        }
        .onChange(of: self.selecteItem) {
            print(self.selecteItem)
        }
        .accentColor(.black)
    }
    
}

#Preview {
    PickerControlView()
}
