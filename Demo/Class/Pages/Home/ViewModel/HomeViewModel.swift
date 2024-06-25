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
        
        var showAlert: Bool = false
        var alertMessage: String?
        
        
        func fetchIndicesDatas() {
            let indicesDatas = APIService.getIndicesDatas()
            self.indicesDatas = indicesDatas ?? []
        }
        
        func fetchAppointments() {
            let appointments = APIService.getAppointments()
            self.appointments = appointments ?? []
        }
        
        func fetchChart() {
            let chartObj = APIService.getChart()
            self.buyData = chartObj?.buy
            self.sellData = chartObj?.selling
        }
        
        func renderAlert(message: String) {
            self.alertMessage = message
            self.showAlert = true
        }
    }

}
