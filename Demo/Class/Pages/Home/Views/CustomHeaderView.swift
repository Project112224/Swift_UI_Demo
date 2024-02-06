//
//  HomeView.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

struct CustomHeaderView: View {
    var body: some View {
        HStack {
            //Spacer()
            Text("時間")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.1, alignment: .leading)
            Text("客戶")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.12, alignment: .leading)
            Text("類別")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.18, alignment: .leading)
            Text("地點")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
            Text("視圖")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.05, alignment: .leading)
            Text("註記")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.05, alignment: .leading)
            Text("約訪")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.07, alignment: .leading)
            Text("互動紀錄")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.1, alignment: .leading)
            //Spacer()
        }
    }
}

#Preview {
    CustomHeaderView()
}
