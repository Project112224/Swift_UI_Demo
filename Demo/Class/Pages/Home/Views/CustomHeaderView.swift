//
//  HomeView.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

struct CustomHeaderView: View {
    var body: some View {
        HStack(spacing: 12) {
            //index
            Text("")
                .frame(width: (UIScreen.main.bounds.width * 20) / 820, alignment: .leading)
            Text("時間")
                .font(.system(size: 14))
                .frame(width: (UIScreen.main.bounds.width * 80) / 820, alignment: .leading)
            Text("客戶")
                .font(.system(size: 14))
                .frame(width: (UIScreen.main.bounds.width * 86) / 820, alignment: .leading)
            Text("類別")
                .font(.system(size: 14))
                .frame(width: (UIScreen.main.bounds.width * 121) / 820, alignment: .leading)
            Text("地點")
                .font(.system(size: 14))
                .frame(width: (UIScreen.main.bounds.width * 121) / 820, alignment: .leading)
            Text("視圖")
                .font(.system(size: 14))
                .frame(width: (UIScreen.main.bounds.width * 40) / 820, alignment: .center)
            Text("註記")
                .font(.system(size: 14))
                .frame(width: (UIScreen.main.bounds.width * 40) / 820, alignment: .center)
            Text("互動紀錄")
                .font(.system(size: 14))
                .frame(width: (UIScreen.main.bounds.width * 60) / 820, alignment: .center)
            Text("約訪")
                .font(.system(size: 14))
                .frame(width: (UIScreen.main.bounds.width * 60) / 820, alignment: .center)
        }
        .listRowBackground(Color.white)
        .frame(height: 40, alignment: .leading)
    }
}

#Preview {
    CustomHeaderView()
}
