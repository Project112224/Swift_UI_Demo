//
//  WorkRowView.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import SwiftUI

struct WorkRowView: View {
    let appointment: Appointment
    let isLast: Bool
    
    init(appointment: Appointment, isLast: Bool) {
        self.appointment = appointment
        self.isLast = isLast
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                //index
                Text(String(appointment.id))
                    .font(.system(size: 14))
                    .frame(width: 20, alignment: .center)
                // 時間
                Text(appointment.time)
                    .font(.system(size: 14))
                    .frame(width: 80, alignment: .leading)
                // 客戶
                Text(appointment.client)
                    .font(.system(size: 14))
                    .frame(width: 86, alignment: .leading)
                // 類別
                Text(appointment.category)
                    .font(.system(size: 14))
                    .frame(width: 121, alignment: .leading)
                // 地點
                Text(appointment.location)
                    .font(.system(size: 14))
                    .frame(width: 121, alignment: .leading)
                    .lineLimit(1)
                // 視圖
                Button(action: {

                }) {
                    Image(ImageName.profile)
                        //.foregroundColor(.black)
                        .background(Color.clear)
                }
                .buttonStyle(BorderlessButtonStyle())
                .frame(width: 40, alignment: .center)
                // 註記
                Button(action: {

                }) {
                    Image(ImageName.iconPaper)
                        //.foregroundColor(.black)
                        .background(Color.clear)
                }
                .buttonStyle(BorderlessButtonStyle())
                .frame(width: 40, alignment: .center)
                //互動紀錄
                Button(action: {

                }) {
                    HStack {
                        Text(appointment.record)
                            .font(.system(size: 14))
                            .foregroundColor(Color.black)
                        Image((appointment.recordEnum == .file) ? ImageName.iconPaperplus : ImageName.iconEdit)
                            //.foregroundColor(.black)
                            .background(Color.clear)
                    }
                    .frame(alignment: .center)
                }
                .buttonStyle(BorderlessButtonStyle())
                .frame(width: 60, alignment: .center)
                //約訪
                //Text(appointment.access).frame(width: UIScreen.main.bounds.width * 0.07, alignment: .leading)
                Button(action: {

                }) {
                    Image(ImageName.iconMore)
                        //.foregroundColor(.black)
                        .background(Color.clear)
                }
                .buttonStyle(BorderlessButtonStyle())
                .frame(width: 60, alignment: .center)
                
            }
            .listRowBackground(Color.white)
            
            if (!isLast) {
                Divider()
            }
        }.frame(height: 36)
        
    }
}
/*
#Preview {
    WorkRowView(appointment: )
}
*/
