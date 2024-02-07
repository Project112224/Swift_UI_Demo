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
            //index
            Text("")
                .frame(width: UIScreen.main.bounds.width * 0.05, alignment: .leading)
            Text("時間")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.1, alignment: .leading)
            Text("客戶")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.1, alignment: .leading)
            Text("類別")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.16, alignment: .leading)
            Text("地點")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
            Text("視圖")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.05, alignment: .center)
            Text("註記")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.05, alignment: .center)
            Text("互動紀錄")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.09, alignment: .center)
            Text("約訪")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width * 0.07, alignment: .center)
            //Spacer()
        }
        .listRowBackground(Color.white)
        .frame(alignment: .leading)
    }
}

#Preview {
    CustomHeaderView()
}
