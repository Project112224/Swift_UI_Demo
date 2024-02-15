//
//  SegmentControlView.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import SwiftUI

struct SegmentControlView: View {
    
    @State private var frames = Array<CGRect>(repeating: .zero, count: 2)
    @State private var section = 0
    
    var items = ["我的約訪","代辦事項"]
    
    var action: ((Int) -> ())?
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: 0) {
                    ForEach(self.items.indices, id: \.self) { index in
                        Button(action: {}, label: {
                            Text(self.items[index])
                                .foregroundColor(index != self.section ? Colors.nonSelect : .white)
                                .font(.system(size: 14))
                        })
                        .padding(EdgeInsets(top: 9, leading: 12, bottom: 9, trailing: 12)).background(
                            GeometryReader { geo in
                                Color.clear.onAppear {
                                    self.frames[index] = geo.frame(in: .global)
                                }
                            }
                        )
                        .onTapGesture {
                            self.section = index
                            self.action?(index)
                        }
                    }
                }
                .background(
                    Capsule().fill(Colors.blue)
                    .frame(width: self.frames[self.section].width,
                           height: self.frames[self.section].height, alignment: .topLeading)
                    .offset(x: self.frames[self.section].minX - self.frames[0].minX)
                    , alignment: .leading
                )
            }
            .animation(.default, value: section)
            .background(Capsule().stroke(Colors.border, lineWidth: 3))
            .frame(height: 38)
        }
    }
}

#Preview {
    SegmentControlView()
}
