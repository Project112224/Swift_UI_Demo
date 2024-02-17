//
//  Indices.swift
//  Demo
//
//  Created by --- on 2024/2/17.
//

import SwiftUI

struct IndicesModel: Identifiable, Decodable {
    var id: Int
    let title: String
    let totalIndices: Double
    let todayIndices: Double
}
