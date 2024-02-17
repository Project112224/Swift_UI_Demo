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
            VStack(spacing: 16) {
                DemoForm {
                    CommonSectionView(type: .work)
                    CustomHeaderView()
                    Divider()
                    ForEach(vm.appointments) { appointment in
                        WorkRowView(
                            appointment: appointment,
                            isLast: vm.appointments.last?.id == appointment.id
                        )
                    }
                }
                
                DemoForm {
                    CommonSectionView(type: .indices)
                    ProductTypeCollView(indicesDatas: vm.indicesDatas).frame(height: 56)
                }
                
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
        }.onAppear() {
            vm.getChart()
            vm.getIndicesDatas()
            vm.getAppointments()
        }
    }

}

#Preview {
    HomeViewController()
}


