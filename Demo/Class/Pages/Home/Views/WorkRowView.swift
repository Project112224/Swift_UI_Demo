//
//  WorkRowView.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import SwiftUI

struct WorkRowView: View {
    let appointment: Appointment
    
    init(appointment: Appointment) {
        self.appointment = appointment
    }
    
    var body: some View {
        HStack {
            //index
            Text(String(appointment.id))
                .frame(width: UIScreen.main.bounds.width * 0.05, alignment: .center)
            // 時間
            Text(appointment.time)
                .frame(width: UIScreen.main.bounds.width * 0.1, alignment: .leading)
            // 客戶
            Text(appointment.client)
                .frame(width: UIScreen.main.bounds.width * 0.1, alignment: .leading)
            // 類別
            Text(appointment.category)
                .frame(width: UIScreen.main.bounds.width * 0.16, alignment: .leading)
            // 地點
            Text(appointment.location)
                .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
            // 視圖
            Button(action: {

            }) {
                Image(ImageName.profile)
                    //.foregroundColor(.black)
                    .background(Color.clear)
            }
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: UIScreen.main.bounds.width * 0.05, alignment: .center)
            // 註記
            Button(action: {

            }) {
                Image(ImageName.iconPaper)
                    //.foregroundColor(.black)
                    .background(Color.clear)
            }
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: UIScreen.main.bounds.width * 0.05, alignment: .center)
            //互動紀錄
            Button(action: {

            }) {
                HStack {
                    Text(appointment.record)
                        .foregroundColor(Color.black)
                    Image((appointment.recordEnum == .file) ? ImageName.iconPaperplus : ImageName.iconEdit)
                        //.foregroundColor(.black)
                        .background(Color.clear)
                }
                .frame(alignment: .center)
            }
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: UIScreen.main.bounds.width * 0.09, alignment: .center)
            //約訪
            //Text(appointment.access).frame(width: UIScreen.main.bounds.width * 0.07, alignment: .leading)
            Button(action: {

            }) {
                Image(ImageName.iconMore)
                    //.foregroundColor(.black)
                    .background(Color.clear)
            }
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: UIScreen.main.bounds.width * 0.07, alignment: .center)
            
        }
        .listRowBackground(Color.white)
    }
}
/*
#Preview {
    WorkRowView(appointment: <#Appointment#>)
}
*/
