//
//  HomeViewController.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import SwiftUI

struct HomeViewController: View {
    
    let viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Colors.grayBackground.ignoresSafeArea()
            VStack(spacing: 16) {
                DemoForm {
                    CommonSectionView(viewModel: viewModel, type: .work)
                    CustomHeaderView()
                    Divider()
                    ForEach(viewModel.appointments) { appointment in
                        WorkRowView(appointment: appointment, isLast: viewModel.appointments.last?.id == appointment.id)
                    }
                }
                
                DemoForm {
                    CommonSectionView(viewModel: viewModel, type: .indices)
                    ProductTypeCollView(viewModel: viewModel).frame(height: 56)
                }
                
                DemoForm {
                    CommonSectionView(viewModel: viewModel, type: .rate)
                    RateChartView()
                        .frame(height: 180, alignment: .center)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
        }
    }

}

#Preview {
    HomeViewController()
}


