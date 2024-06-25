//
//  HomeModel.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import Foundation

struct AppointmentModel: Identifiable, Decodable {
    let id: Int
    /// 時間
    let time: String
    /// 客戶
    let client: String
    /// 類別
    let category: String
    /// 地點
    let location: String
    /// 視圖
    let view: String
    /// 註記
    let note: String
    /// 互動紀錄
    let record: String
    
    var recordEnum: recordType {
        return recordType(rawValue: record) ?? .other
    }
    
    enum recordType: String, CaseIterable {
        case file = "建檔" //建檔
        case edit = "編輯" //編輯
        case other
    }
    
    init() {
        self.id = 0
        self.time = ""
        self.client = ""
        self.category = ""
        self.location = ""
        self.view = ""
        self.note = ""
        self.record = ""
    }
    
}
