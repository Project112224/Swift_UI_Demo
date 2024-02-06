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
            // 時間
            Text(appointment.time)
                .frame(width: UIScreen.main.bounds.width * 0.1, alignment: .leading)
            // 客戶
            Text(appointment.client)
                .frame(width: UIScreen.main.bounds.width * 0.12, alignment: .leading)
            // 類別
            Text(appointment.category)
                .frame(width: UIScreen.main.bounds.width * 0.18, alignment: .leading)
            // 地點
            Text(appointment.location)
                .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
            // 視圖
            Text(appointment.view)
                .frame(width: UIScreen.main.bounds.width * 0.05, alignment: .leading)
            // 註記
            Text(appointment.note)
                .frame(width: UIScreen.main.bounds.width * 0.05, alignment: .leading)
            //約訪
            Text(appointment.access)
                .frame(width: UIScreen.main.bounds.width * 0.07, alignment: .leading)
            //互動紀錄
            Text(appointment.record)
                .frame(width: UIScreen.main.bounds.width * 0.1, alignment: .leading)
        }
        .listRowBackground(Color.clear)
    }
}
/*
#Preview {
    WorkRowView(appointment: <#Appointment#>)
}
*/
