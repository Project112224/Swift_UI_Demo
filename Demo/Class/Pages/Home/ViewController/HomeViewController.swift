//
//  HomeViewController.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import SwiftUI

struct HomeViewController: View {
    
    @State var vm: HomeViewModel = .init()
    
    var body: some View {
        ZStack(alignment: .top) {
            Colors.grayBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    // 工作檢視
                    DemoForm {
                        CommonSectionView(type: .work)
                            .padding(.bottom, 8)
                        CustomHeaderView()
                            .frame(maxWidth: .infinity)
                        Divider()
                        ForEach(vm.appointments) { appointment in
                            WorkRowView(
                                appointment: appointment,
                                isLast: vm.appointments.last?.id == appointment.id,
                                viewAction: { self.renderAlert(message: "時間: \($0.time)\n客戶: \($0.client)\n類別: \($0.category)\n地點: \($0.location)\n註記: \($0.note)") },
                                noteAction: { self.renderAlert(message: $0) },
                                recordAction: {},
                                otherAction: {}
                            )
                            .frame(maxWidth: .infinity)
                        }
                    }
                    // 常用指數
                    DemoForm {
                        CommonSectionView(type: .indices)
                        ProductTypeCollView(indicesDatas: vm.indicesDatas).frame(height: 56)
                    }
                    // 匯率走勢
                    DemoForm {
                        CommonSectionView(type: .rate)
                        RateChartView(
                            buy: vm.buyData ?? [],
                            sell: vm.sellData ?? []
                        )
                            .frame(height: 180, alignment: .center)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
            }
            
            if (vm.showAlert) {
                CustomAlert(
                    presentAlert: $vm.showAlert,
                    alertType: .paper(
                        message: vm.alertMessage ?? "",
                        rightActionText: "OK"
                    ),
                    widthOffset: 0.65, 
                    messageAlignment: .leading,
                    rightButtonAction:  {
                        vm.alertMessage = nil
                    }
                )
            }
        }.onAppear() {
            vm.fetchChart()
            vm.fetchIndicesDatas()
            vm.fetchAppointments()
        }
    }
}

extension HomeViewController {
    
    func renderAlert(message: String) {
        vm.renderAlert(message: message)
    }
    
}

#Preview {
    HomeViewController()
}


