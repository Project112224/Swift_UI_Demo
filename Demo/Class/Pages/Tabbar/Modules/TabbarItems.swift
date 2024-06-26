//
//  TabbarItems.swift
//  Demo
//
//  Created by --- on 2024/2/16.
//

import Foundation

enum TabbedItems: Int, CaseIterable{
    case home = 0
    case trendUp
    case trend
    case market
    case commodity
    
    var title: String{
        switch self {
        case .home:
            return "首頁"
        case .trendUp:
            return "指數"
        case .trend:
            return "匯率"
        case .market:
            return "市場動態"
        case .commodity:
            return "商品資訊"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return ImageName.home
        case .trendUp:
            return ImageName.trendUp
        case .trend:
            return ImageName.iconTrend
        case .market:
            return ImageName.iconMarket
        case .commodity:
            return ImageName.iconCommodity
        }
    }
}
