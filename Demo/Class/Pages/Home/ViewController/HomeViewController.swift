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
        
        List {
            
            Section() {
                CommonSectionView(viewModel: viewModel, type: .work)
                CustomHeaderView()
                ForEach(viewModel.appointments) { appointment in
                    WorkRowView(appointment: appointment)
                }
            }
            
            Section() {
                CommonSectionView(viewModel: viewModel, type: .indices)
                ProductTypeCollView(viewModel: viewModel)
            }
            
            Section() {
                CommonSectionView(viewModel: viewModel, type: .rate)
            }
                        
        }
        .padding(.top)
        .listStyle(InsetGroupedListStyle())
            
    }

}

#Preview {
    HomeViewController()
}


