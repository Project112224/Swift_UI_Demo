//
//  HomeViewModel.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import Foundation

extension HomeViewController {
    
    @Observable
    class HomeViewModel {
        
        var appointments: [AppointmentModel] = []
        var indicesDatas: [IndicesModel] = []
        
        var buyData: [RateData]?
        var sellData: [RateData]?
        
        
        func getIndicesDatas() {
            let indicesDatas = APIConfig.getIndicesDatas()
            self.indicesDatas = indicesDatas ?? []
        }
        
        func getAppointments() {
            let appointments = APIConfig.getAppointments()
            self.appointments = appointments ?? []
        }
        
        func getChart() {
            let chartObj = APIConfig.getChart()
            self.buyData = chartObj?.buy
            self.sellData = chartObj?.selling
        }
        
    }

}
