//
//  HomeViewController.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import SwiftUI



struct HomeViewController: View {
    
    let appointments = [
      Appointment(
        id: 1,
        time: "09:30 AM",
        client: "陳○淳",
        category: "面訪-專員親訪",
        location: "內湖大潤發旁",
        view: "建檔",
        note: "",
        access: "123",
        record: "321"
      ),
      Appointment(
        id: 2,
        time: "10:30 AM",
        client: "沈Ｏ又又又...",
        category: "面訪-客戶來行",
        location: "松仁路7號18樓",
        view: "更多…",
        note: "",
        access: "123",
        record: "321"
      ),
      Appointment(
        id: 3,
        time: "10:30 AM",
        client: "潘Ｏ萌",
        category: "面訪-專員親訪",
        location: "羅斯福路8段8888號",
        view: "更多…",
        note: "",
        access: "123",
        record: "..."
      ),
    ]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: CustomHeaderView().frame(alignment: .leading)) {
                    List(appointments) { appointments in
                        WorkRowView(appointment: appointments)
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

}

#Preview {
    HomeViewController()
}



