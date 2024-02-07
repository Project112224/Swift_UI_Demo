//
//  ProductTypeCollVCell.swift
//  Demo
//
//  Created by Brook on 2024/2/7.
//

import SwiftUI

struct ProductTypeCollVCell: View {
    
    let indicesData: Indices
    
    init(indicesData: Indices) {
        self.indicesData = indicesData
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer(minLength: 8)
                Text(self.indicesData.title)
                
                Spacer()
                
                Text(String(self.indicesData.totalIndices))
                    .foregroundColor(Color.red)
                Spacer(minLength: 8)
            }
            HStack {
                Spacer(minLength: 50)
                Image((self.indicesData.todayIndices > 0) ? ImageName.trendUp : ImageName.trendDown)

                Spacer()
                
                Text(String(self.indicesData.todayIndices)+"%")
                    .foregroundColor((self.indicesData.todayIndices > 0) ? Color.red : Colors.green500)
                Spacer(minLength: 8)
            }
            .frame(alignment: .trailing)
        }
        .frame(width: 145, height: 56)
        //.background(Color.red)
        
        /*
        Image(ImageName.launchCubcLogoIcon)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: (UIScreen.main.bounds.width * 105) / 414, height: (UIScreen.main.bounds.width * 105) / 414)
            .cornerRadius(10)
         */
    }
}

struct ProductTypeCollVCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductTypeCollVCell(indicesData: Indices(id: 1, title: "", totalIndices: 0, todayIndices: 0)).frame(width: 145, height: 56)
        /*
        ProductTypeCollVCell()
            .previewLayout(.fixed(width: (UIScreen.main.bounds.width * 105) / 414, height: (UIScreen.main.bounds.width * 105) / 414))
         */
    }
}
