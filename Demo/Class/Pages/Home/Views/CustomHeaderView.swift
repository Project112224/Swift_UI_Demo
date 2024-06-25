//
//  HomeView.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

struct CustomHeaderView: View {
    var body: some View {
        GeometryReader { geometry in
            let widthOffset = (geometry.size.width - 48) / (UIDevice.isIPad ? 9 : 5);
            HStack {
                //index
                Text("")
                    .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .leading)
                
                
                if (UIDevice.isIPad) {
                    Text("時間")
                        .font(.system(size: 14))
                        .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .leading)
                }
                
                
                Text("客戶")
                    .font(.system(size: 14))
                    .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .leading)
                if (UIDevice.isIPad) {
                    Text("類別")
                        .font(.system(size: 14))
                        .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .leading)
                    Text("地點")
                        .contentMargins(0)
                        .font(.system(size: 14))
                        .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .leading)
                }
                Text("視圖")
                    .font(.system(size: 14))
                    .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .center)
                if (UIDevice.isIPad) {
                    Text("註記")
                        .font(.system(size: 14))
                        .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .center)
                }
                Text("互動紀錄")
                    .font(.system(size: 14))
                    .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .center)
                    .minimumScaleFactor(0.2)
                Text("約訪")
                    .font(.system(size: 14))
                    .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .center)
            }
            .listRowBackground(Color.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.frame(height: 40, alignment: .leading)
    }
}

#Preview {
    CustomHeaderView()
}
