//
//  APIConfig.swift
//  Demo
//
//  Created by --- on 2024/2/16.
//

import Foundation


class APIConfig {
    
    
    static func getChart() -> ChartData? {
        guard let file = Bundle.main.path(forResource: "chart", ofType: "json")
        else {
            print("Json file not found")
            return nil
        }
        
        do {
            let json = try String(contentsOfFile: file).data(using: .utf8)
            let getResponse = try JSONSerialization.jsonObject(with: json ?? Data(), options: .allowFragments)
            let jsonData = try? JSONSerialization.data(withJSONObject: getResponse as Any)
            let resultModel = try JSONDecoder.init().decode(ChartData.self, from: jsonData!)
            return resultModel
        } catch {
            print("error serializing JSON: \(error)")
        }
        return nil
    }
    
    
    static func getIndicesDatas() -> [IndicesModel]? {
        guard let file = Bundle.main.path(forResource: "indices_datas", ofType: "json")
        else {
            print("Json file not found")
            return nil
        }
        
        do {
            let json = try String(contentsOfFile: file).data(using: .utf8)
            let getResponse = try JSONSerialization.jsonObject(with: json ?? Data(), options: .allowFragments)
            let jsonData = try? JSONSerialization.data(withJSONObject: getResponse as Any)
            let resultModel = try JSONDecoder.init().decode([IndicesModel].self, from: jsonData!)
            return resultModel
        } catch {
            print("error serializing JSON: \(error)")
        }
        return nil
    }
    
    static func getAppointments() -> [AppointmentModel]? {
        guard let file = Bundle.main.path(forResource: "appointments", ofType: "json")
        else {
            print("Json file not found")
            return nil
        }
        
        do {
            let json = try String(contentsOfFile: file).data(using: .utf8)
            let getResponse = try JSONSerialization.jsonObject(with: json ?? Data(), options: .allowFragments)
            let jsonData = try? JSONSerialization.data(withJSONObject: getResponse as Any)
            let resultModel = try JSONDecoder.init().decode([AppointmentModel].self, from: jsonData!)
            return resultModel
        } catch {
            print("error serializing JSON: \(error)")
        }
        return nil
    }
}
