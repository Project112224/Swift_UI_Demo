//
//  ChartData.swift
//  Demo
//
//  Created by --- on 2024/2/17.
//

import SwiftUI

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
