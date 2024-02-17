//
//  HomeModel.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import Foundation

struct AppointmentModel: Identifiable, Decodable {
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
