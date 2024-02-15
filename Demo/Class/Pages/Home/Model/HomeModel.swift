//
//  HomeModel.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import Foundation

struct Appointment: Identifiable, Decodable {
    let id: Int
    let time: String
    let client: String
    let category: String
    let location: String
    let view: String
    let note: String
    let access: String
    let record: String
    
    var recordEnum: recordType {
        return recordType(rawValue: record) ?? .other
    }
    enum recordType: String, CaseIterable {
        case file = "建檔" //建檔
        case edit = "編輯" //編輯
        case other
    }
    
}

struct Indices: Identifiable, Decodable {
    var id: Int
    let title: String
    let totalIndices: Double
    let todayIndices: Double
}

struct ChartData: Identifiable {
    let id = UUID()
    let date: Date
    let formatDate: String
    let changeRate: Double

    init(year: Int, month: Int, day: Int, changeRate: Double) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy/MM/dd"
        self.formatDate = inputFormatter.string(from: self.date)
        self.changeRate = changeRate
    }
}
