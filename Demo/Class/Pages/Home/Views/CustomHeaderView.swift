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
            //Spacer()
            //index
            Text("")
                .frame(width: 20, alignment: .leading)
            Text("時間")
                .font(.system(size: 14))
                .frame(width: 80, alignment: .leading)
            Text("客戶")
                .font(.system(size: 14))
                .frame(width: 86, alignment: .leading)
            Text("類別")
                .font(.system(size: 14))
                .frame(width: 121, alignment: .leading)
            Text("地點")
                .font(.system(size: 14))
                .frame(width: 121, alignment: .leading)
            Text("視圖")
                .font(.system(size: 14))
                .frame(width: 40, alignment: .center)
            Text("註記")
                .font(.system(size: 14))
                .frame(width: 40, alignment: .center)
            Text("互動紀錄")
                .font(.system(size: 14))
                .frame(width: 60, alignment: .center)
            Text("約訪")
                .font(.system(size: 14))
                .frame(width: 60, alignment: .center)
            //Spacer()
        }
        .listRowBackground(Color.white)
        .frame(height: 40, alignment: .leading)
    }
}

#Preview {
    CustomHeaderView()
}
