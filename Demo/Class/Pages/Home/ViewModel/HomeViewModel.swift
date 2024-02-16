//
//  HomeViewModel.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var appointments: [Appointment] = []
    @Published var indicesDatas: [Indices] = []
    
    init() {
        self.getAppointments()
        self.getIndicesDatas()
    }
    
    func getIndicesDatas() {
        self.indicesDatas = [
            Indices(
                id: 1,
                title: "道瓊",
                totalIndices: 36577.9,
                todayIndices: 0.5
            ),
            Indices(
                id: 2,
                title: "標普",
                totalIndices: 36577.9,
                todayIndices: 0.5
            ),
            Indices(
                id: 3,
                title: "黃金",
                totalIndices: 36577.9,
                todayIndices: 0.5
            ),
            Indices(
                id: 4,
                title: "台幣",
                totalIndices: 32.5,
                todayIndices: -0.5
            ),
            Indices(
                id: 5,
                title: "上證",
                totalIndices: 3003.4,
                todayIndices: -0.5
            ),
            Indices(
                id: 1,
                title: "道瓊",
                totalIndices: 36577.9,
                todayIndices: 0.5
            ),
            Indices(
                id: 2,
                title: "標普",
                totalIndices: 36577.9,
                todayIndices: 0.5
            ),
            Indices(
                id: 3,
                title: "黃金",
                totalIndices: 36577.9,
                todayIndices: 0.5
            ),
            Indices(
                id: 4,
                title: "台幣",
                totalIndices: 32.5,
                todayIndices: -0.5
            ),
            Indices(
                id: 5,
                title: "上證",
                totalIndices: 3003.4,
                todayIndices: -0.5
            )
        ]
    }
    
    func getAppointments() {
        
        self.appointments = [
            Appointment(
              id: 1,
              time: "09:30 AM",
              client: "陳○淳",
              category: "面訪-專員親訪",
              location: "內湖大潤發旁",
              view: "建檔",
              note: "",
              access: "123",
              record: "建檔"
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
              record: "編輯"
            ),
            Appointment(
              id: 3,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-專員親訪",
              location: "羅斯福路8段8888號",
              view: "",
              note: "",
              access: "123",
              record: "建檔"
            ),
            Appointment(
              id: 4,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-行內",
              location: "---",
              view: "",
              note: "",
              access: "123",
              record: "建檔"
            ),
            Appointment(
              id: 5,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-專員親訪",
              location: "羅斯福路8段8888號",
              view: "更多…",
              note: "",
              access: "123",
              record: "建檔"
            ),
            Appointment(
              id: 6,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-專員親訪",
              location: "羅斯福路8段8888號",
              view: "更多…",
              note: "",
              access: "123",
              record: "建檔"
            ),
            Appointment(
              id: 7,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-專員親訪",
              location: "羅斯福路8段8888號",
              view: "更多…",
              note: "",
              access: "123",
              record: "建檔"
            ),
            Appointment(
              id: 8,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-專員親訪",
              location: "羅斯福路8段8888號",
              view: "更多…",
              note: "",
              access: "123",
              record: "建檔"
            ),
            Appointment(
              id: 9,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-專員親訪",
              location: "羅斯福路8段8888號",
              view: "更多…",
              note: "",
              access: "123",
              record: "建檔"
            ),
            Appointment(
              id: 10,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-專員親訪",
              location: "羅斯福路8段8888號",
              view: "更多…",
              note: "",
              access: "123",
              record: "建檔"
            )
          ]
        
    }
    
    func getAppointmentsUpdate() {
        
        self.appointments = [
            Appointment(
              id: 1,
              time: "09:30 AM",
              client: "陳○淳",
              category: "面訪-專員親訪",
              location: "內湖大潤發旁",
              view: "建檔",
              note: "",
              access: "123",
              record: "建檔"
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
              record: "編輯"
            ),
            Appointment(
              id: 3,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-專員親訪",
              location: "羅斯福路8段8888號",
              view: "",
              note: "",
              access: "123",
              record: "建檔"
            ),
            Appointment(
              id: 4,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-行內",
              location: "---",
              view: "",
              note: "",
              access: "123",
              record: "建檔"
            ),
            Appointment(
              id: 5,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-專員親訪",
              location: "羅斯福路8段8888號",
              view: "更多…",
              note: "",
              access: "123",
              record: "建檔"
            ),
            Appointment(
              id: 6,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-專員親訪",
              location: "羅斯福路8段8888號",
              view: "更多…",
              note: "",
              access: "123",
              record: "建檔"
            ),
            Appointment(
              id: 7,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-專員親訪",
              location: "羅斯福路8段8888號",
              view: "更多…",
              note: "",
              access: "123",
              record: "建檔"
            ),
            Appointment(
              id: 8,
              time: "10:30 AM",
              client: "潘Ｏ萌",
              category: "面訪-專員親訪",
              location: "羅斯福路8段8888號",
              view: "更多…",
              note: "",
              access: "123",
              record: "建檔"
            )
          ]
        
    }
    
    
    func getChart() -> ChartData? {
        return APIConfig.getChart()
    }
    
}
