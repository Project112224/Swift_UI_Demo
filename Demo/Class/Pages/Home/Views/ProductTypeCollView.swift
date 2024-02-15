//
//  ProductTypeCollView.swift
//  Demo
//
//  Created by Brook on 2024/2/7.
//

import SwiftUI

struct ProductTypeCollView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            Spacer(minLength: 8)
            HStack {
                
                ForEach(viewModel.indicesDatas) { indicesData in
                    ProductTypeCollVCell(indicesData: indicesData)
                }
                
            }
            Spacer(minLength: 16)
        }
        
    }
}

struct ProductTypeCollView_Previews: PreviewProvider {
    static var previews: some View {
        ProductTypeCollView(viewModel: HomeViewModel())
    }
}
