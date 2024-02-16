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

struct ChartData: Codable, Identifiable {
    let id = UUID()
    var buy: [RateData]
    var selling: [RateData]

    enum CodingKeys: String, CodingKey {
        case buy
        case selling
    }
}

struct RateData: Codable, Identifiable {
    let id = UUID()
    var date: String
    var rate: Double

    var formatDate: String {
        let dateList = self.date.split(separator: "/")
        return "\(dateList[0])/\(dateList[1])"
    }
    
    var day: String {
        return String(self.date.split(separator: "/").last ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case date
        case rate
    }
}
