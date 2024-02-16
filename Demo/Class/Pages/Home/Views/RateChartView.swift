//
//  RateChartView.swift
//  Demo
//
//  Created by --- on 2024/2/15.
//

import SwiftUI
import Charts

struct RateChartView: View {
    
    let buyData: [RateData]
    let sellingData: [RateData]
    
    init(buy: [RateData], sell: [RateData]) {
        self.buyData = buy
        self.sellingData = sell
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 14) {
                Button(action: {
                    print("left")
                }, label: {
                    Image(ImageName.chevronLeft)
                }).frame(width: 24, height: 24)
                    .background(Colors.grayBackground)
                    .clipShape(.circle)
                
                Chart {
                    ForEach(buyData) { item in
                        LineMark(
                            x: .value("Date", item.date),
                            y: .value("Rate", item.rate)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(Colors.greenLine)
                        .foregroundStyle(by: .value("Date", "賣出"))
                        
                    }

                    ForEach(sellingData) { item in
                        LineMark(
                            x: .value("Date", item.date),
                            y: .value("Rate", item.rate)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(Colors.brownLine)
                        .foregroundStyle(by: .value("Date", "買入"))
                    }
                }
                .chartForegroundStyleScale([
                    "賣出" : Colors.greenLine,
                    "買入": Colors.brownLine
                ])
                .chartLegend(alignment: .trailing)
                .frame(height: 150)
                .chartYScale(domain: [30, 32])
                .chartYAxis() { AxisMarks(position: .leading) }
                .chartXAxis {
                    AxisMarks { value in
                        let data = self.sellingData[value.index]
                        if (data.day == "05") {
                            AxisValueLabel {
                                Text(data.formatDate)
                            }
                        }
                    }
                }
                
                Button(action: {
                    print("right")
                }, label: {
                    Image(ImageName.chevronRight)
                }).frame(width: 24, height: 24)
                    .background(Colors.grayBackground)
                    .clipShape(.circle)
            }
        }
        .padding()
    }
}

#Preview {
    RateChartView(buy: [], sell: [])
}
