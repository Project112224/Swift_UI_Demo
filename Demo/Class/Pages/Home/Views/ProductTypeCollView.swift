//
//  ProductTypeCollView.swift
//  Demo
//
//  Created by Brook on 2024/2/7.
//

import SwiftUI

struct ProductTypeCollView: View {
    
    var indicesDatas: [IndicesModel]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(indicesDatas) { indicesData in
                    ProductTypeCollVCell(
                        indicesData: indicesData,
                        isLast: indicesDatas.last?.id == indicesData.id
                    )
                }
            }
        }
        
    }
}

struct ProductTypeCollView_Previews: PreviewProvider {
    static var previews: some View {
        ProductTypeCollView(indicesDatas: [])
    }
}
