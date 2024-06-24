//
//  WorkRowView.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import SwiftUI

struct WorkRowView: View {
    let appointment: AppointmentModel
    let isLast: Bool
    
    init(appointment: AppointmentModel, isLast: Bool) {
        self.appointment = appointment
        self.isLast = isLast
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack(spacing: 12) {
                    //index
                    Text(String(appointment.id))
                        .frame(width: (geometry.size.width * 20) / 820, alignment: .center)
                    // 時間
                    Text(appointment.time)
                        .font(.system(size: 14))
                        .frame(width: (geometry.size.width * 80) / 820, alignment: .leading)
                    // 客戶
                    Text(appointment.client)
                        .font(.system(size: 14))
                        .frame(width: (geometry.size.width * 86) / 820, alignment: .leading)
                    // 類別
                    Text(appointment.category)
                        .font(.system(size: 14))
                        .frame(width: (geometry.size.width * 121) / 820, alignment: .leading)
                    // 地點
                    Text(appointment.location)
                        .font(.system(size: 14))
                        .frame(width: (geometry.size.width * 121) / 820, alignment: .leading)
                        .lineLimit(1)
                    // 視圖
                    Button(action: {

                    }) {
                        Image(ImageName.profile)
                            //.foregroundColor(.black)
                            .background(Color.clear)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(width: (geometry.size.width * 40) / 820, alignment: .center)
                    // 註記
                    Button(action: {

                    }) {
                        Image(ImageName.iconPaper)
                            //.foregroundColor(.black)
                            .background(Color.clear)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(width: (geometry.size.width * 40) / 820, alignment: .center)
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
                    .frame(width: (geometry.size.width * 65) / 820, alignment: .center)
                    //約訪
                    //Text(appointment.access).frame(width: UIScreen.main.bounds.width * 0.07, alignment: .leading)
                    Button(action: {

                    }) {
                        Image(ImageName.iconMore)
                            //.foregroundColor(.black)
                            .background(Color.clear)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(width: (geometry.size.width * 60) / 820, alignment: .center)
                }
                .listRowBackground(Color.white)
                
                if (!isLast) {
                    Divider()
                } else {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.clear)
                }
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }.frame(height: 36)
    }
}

//#Preview {
//    WorkRowView(
//        appointment: AppointmentModel(), isLast: false
//    )
//}
