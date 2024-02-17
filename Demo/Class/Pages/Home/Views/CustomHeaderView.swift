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
            HStack(spacing: 12) {
                //index
                Text("")
                    .frame(width: (geometry.size.width * 20) / 820, alignment: .leading)
                Text("時間")
                    .font(.system(size: 14))
                    .frame(width: (geometry.size.width * 80) / 820, alignment: .leading)
                Text("客戶")
                    .font(.system(size: 14))
                    .frame(width: (geometry.size.width * 86) / 820, alignment: .leading)
                Text("類別")
                    .font(.system(size: 14))
                    .frame(width: (geometry.size.width * 121) / 820, alignment: .leading)
                Text("地點")
                    .font(.system(size: 14))
                    .frame(width: (geometry.size.width * 121) / 820, alignment: .leading)
                Text("視圖")
                    .font(.system(size: 14))
                    .frame(width: (geometry.size.width * 40) / 820, alignment: .center)
                Text("註記")
                    .font(.system(size: 14))
                    .frame(width: (geometry.size.width * 40) / 820, alignment: .center)
                Text("互動紀錄")
                    .font(.system(size: 14))
                    .frame(width: (geometry.size.width * 65) / 820, alignment: .center)
                Text("約訪")
                    .font(.system(size: 14))
                    .frame(width: (geometry.size.width * 60) / 820, alignment: .center)
            }
            .listRowBackground(Color.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.frame(height: 40, alignment: .leading)
    }
}

#Preview {
    CustomHeaderView()
}
