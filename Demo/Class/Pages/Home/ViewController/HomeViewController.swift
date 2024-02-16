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
        VStack(spacing: 16) {
            VStack {
                DemoForm {
                    CommonSectionView(viewModel: viewModel, type: .work)
                    CustomHeaderView()
                    ForEach(viewModel.appointments) { appointment in
                        WorkRowView(appointment: appointment)
                    }
                }
                
                DemoForm {
                    CommonSectionView(viewModel: viewModel, type: .indices)
                    ProductTypeCollView(viewModel: viewModel)
                }
                
                DemoForm {
                    CommonSectionView(viewModel: viewModel, type: .rate)
                    RateChartView()
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
            
        }.background(Colors.grayBackground)
        
    }

}

#Preview {
    HomeViewController()
}


