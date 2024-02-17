//
//  ProductTypeCollVCell.swift
//  Demo
//
//  Created by Brook on 2024/2/7.
//

import SwiftUI

struct ProductTypeCollVCell: View {
    
    let indicesData: IndicesModel
    
    let isLast: Bool
    
    init(indicesData: IndicesModel, isLast: Bool) {
        self.indicesData = indicesData
        self.isLast = isLast
    }
    
    var body: some View {
        
        HStack {
            VStack {
                HStack {
                    Spacer(minLength: 8)
                    Text(self.indicesData.title)
                        .font(.system(size: 14))
                    
                    Spacer()
                    
                    Text(String(self.indicesData.totalIndices))
                        .font(.system(size: 16))
                        .foregroundColor(Color.red)
                    Spacer(minLength: 8)
                }
                HStack {
                    Spacer(minLength: 50)
                    Image((self.indicesData.todayIndices > 0) ? ImageName.trendUp : ImageName.trendDown)

                    Spacer()
                    
                    Text(String(self.indicesData.todayIndices)+"%")
                        .font(.system(size: 16))
                        .foregroundColor((self.indicesData.todayIndices > 0) ? Color.red : Colors.green500)
                    Spacer(minLength: 8)
                }
                .frame(alignment: .trailing)
            }
            .frame(width: 145, height: 56)
            
            if (!isLast) {
                Divider()
            }
        }.frame(height: 56)
    }
}

struct ProductTypeCollVCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductTypeCollVCell(indicesData: IndicesModel(id: 1, title: "", totalIndices: 0, todayIndices: 0), isLast: true).frame(width: 145, height: 56)
    }
}
