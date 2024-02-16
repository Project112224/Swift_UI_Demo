//
//  RateChartView.swift
//  Demo
//
//  Created by --- on 2024/2/15.
//

import SwiftUI
import Charts

struct RateChartView: View {
    
    let buyData = [
        ChartData(year: 2020, month: 11, day: 1, changeRate: 30.5),
        ChartData(year: 2020, month: 11, day: 7, changeRate: 30.6),
        ChartData(year: 2020, month: 11, day: 14, changeRate: 30.8),
        ChartData(year: 2020, month: 11, day: 21, changeRate: 30.6),
        ChartData(year: 2020, month: 11, day: 28, changeRate: 30.8),
        ChartData(year: 2020, month: 11, day: 31, changeRate: 30.9),
        ChartData(year: 2020, month: 12, day: 1, changeRate: 30.8),
        ChartData(year: 2020, month: 12, day: 7, changeRate: 30.7),
        ChartData(year: 2020, month: 12, day: 14, changeRate: 30.8),
        ChartData(year: 2020, month: 12, day: 21, changeRate: 30.9),
        ChartData(year: 2020, month: 12, day: 28, changeRate: 30.8),
        ChartData(year: 2021, month: 1, day: 1, changeRate: 30.8),
        ChartData(year: 2021, month: 1, day: 7, changeRate: 30.8),
        ChartData(year: 2021, month: 1, day: 14, changeRate: 31.0),
        ChartData(year: 2021, month: 1, day: 21, changeRate: 31.3),
        ChartData(year: 2021, month: 1, day: 28, changeRate: 31.5),
        ChartData(year: 2021, month: 1, day: 31, changeRate: 31.6),
        ChartData(year: 2021, month: 2, day: 1, changeRate: 31.8),
        ChartData(year: 2021, month: 2, day: 7, changeRate: 32.1),
        ChartData(year: 2021, month: 2, day: 14, changeRate: 31.6),
        ChartData(year: 2021, month: 2, day: 21, changeRate: 31.7),
        ChartData(year: 2021, month: 2, day: 28, changeRate: 31.8),
        ChartData(year: 2021, month: 2, day: 30, changeRate: 31.9),
    ]
    
    let sellingData = [
        ChartData(year: 2020, month: 11, day: 1, changeRate: 30.1),
        ChartData(year: 2020, month: 11, day: 7, changeRate: 30.2),
        ChartData(year: 2020, month: 11, day: 14, changeRate: 30.4),
        ChartData(year: 2020, month: 11, day: 21, changeRate: 30.2),
        ChartData(year: 2020, month: 11, day: 28, changeRate: 30.4),
        ChartData(year: 2020, month: 11, day: 31, changeRate: 30.5),
        ChartData(year: 2020, month: 12, day: 1, changeRate: 30.4),
        ChartData(year: 2020, month: 12, day: 7, changeRate: 30.3),
        ChartData(year: 2020, month: 12, day: 14, changeRate: 30.4),
        ChartData(year: 2020, month: 12, day: 21, changeRate: 30.5),
        ChartData(year: 2020, month: 12, day: 28, changeRate: 30.4),
        ChartData(year: 2021, month: 1, day: 1, changeRate: 30.4),
        ChartData(year: 2021, month: 1, day: 7, changeRate: 30.4),
        ChartData(year: 2021, month: 1, day: 14, changeRate: 30.6),
        ChartData(year: 2021, month: 1, day: 21, changeRate: 30.9),
        ChartData(year: 2021, month: 1, day: 28, changeRate: 31.1),
        ChartData(year: 2021, month: 1, day: 31, changeRate: 31.2),
        ChartData(year: 2021, month: 2, day: 1, changeRate: 31.4),
        ChartData(year: 2021, month: 2, day: 7, changeRate: 31.7),
        ChartData(year: 2021, month: 2, day: 14, changeRate: 31.2),
        ChartData(year: 2021, month: 2, day: 21, changeRate: 31.3),
        ChartData(year: 2021, month: 2, day: 28, changeRate: 31.4),
        ChartData(year: 2021, month: 2, day: 30, changeRate: 31.5),
    ]
    
    var volumeData: [(String, [ChartData])]
    
    init() {
        volumeData = [
            (state: "賣出", data: self.buyData),
            (state: "買入", data: self.sellingData),
        ]
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
                    ForEach(volumeData, id: \.0) { series in
                        ForEach(series.1) { item in
                            LineMark(
                                x: .value("Date", item.formatDate),
                                y: .value("Rate", item.changeRate)
                            )
                        }
                        .foregroundStyle(by: .value("Volume", series.0))
                    }
                }
                .chartLegend(alignment: .trailing)
                .frame(height: 150)
//                .chartXAxis {
//                    AxisMarks(values: .stride(by: .month, count: 1)) { value in
                        
//                        if let date = value.as(Date.self) {
//                            let month = Calendar.current.component(.month, from: date)
//                            switch month {
//                            case 0, 12:
//                                AxisValueLabel(format: .dateTime.month())
//                            default:
//                                AxisValueLabel(format: .dateTime.hour(.defaultDigits(amPM: .omitted)))
//                            }
//                            AxisGridLine()
//                            AxisTick()
//                        }
//                    }
//                }
                .chartYScale(domain: [30, 33])
                
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
    RateChartView()
}
