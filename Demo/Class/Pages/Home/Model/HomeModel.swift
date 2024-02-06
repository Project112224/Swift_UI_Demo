//
//  HomeModel.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import Foundation

struct Appointment: Identifiable {
    let id: Int
    let time: String
    let client: String
    let category: String
    let location: String
    let view: String
    let note: String
    let access: String
    let record: String
}
