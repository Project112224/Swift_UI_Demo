//
//  TabbarViewController.swift
//  Demo
//
//  Created by Brook on 2024/2/7.
//

import SwiftUI

struct TabbarViewController: View {
    @State private var selectedView = 0
    
    init() {
        //UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {

        TabView(selection: $selectedView) {
            
            NavigationView {
                HomeViewController()
            }
            .tabItem {
                Image(ImageName.home).renderingMode(.template)
                Text("首頁")
            }.tag(0)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.trendUp).renderingMode(.template)
                Text("指數")
            }.tag(1)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.iconTrend).renderingMode(.template)
                Text("匯率")
            }.tag(2)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.iconMarket).renderingMode(.template)
                Text("市場動態")
            }.tag(3)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.iconCommodity).renderingMode(.template)
                Text("商品資訊")
            }.tag(4)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.link).renderingMode(.template)
                Text("常用網站")
            }.tag(5)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.paperplus).renderingMode(.template)
                Text("新增約訪")
            }.tag(6)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.document).renderingMode(.template)
                Text("新增待辦")
            }.tag(7)
        }
        .accentColor(Colors.green700)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(
            leading: Title(),
            trailing: HStack {
                Text("2023 / 12 / 11 (一) 理專 蔡立方 您好")
            }
        )
        
    }
}

#Preview {
    TabbarViewController()
}
