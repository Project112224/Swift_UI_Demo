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
        UINavigationBar.appearance().backgroundColor = .white
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().unselectedItemTintColor = Colors.unselectedItemTintColor
    }
    
    var body: some View {

        TabView(selection: $selectedView) {
            
            NavigationView {
                HomeViewController()
            }
            .tabItem {
                VStack {
                    Image(ImageName.home)
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                    Text("首頁").font(.system(size: 14))
                }
                .frame(height: 100)
            }.tag(0)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.trendUp)
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.red)
                Text("指數").font(.system(size: 14)).foregroundColor(.red)
            }.tag(1)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.iconTrend)
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                Text("匯率").font(.system(size: 14))
            }.tag(2)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.iconMarket)
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                Text("市場動態").font(.system(size: 14))
            }.tag(3)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.iconCommodity)
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                Text("商品資訊").font(.system(size: 14))
            }.tag(4)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.link)
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                Text("常用網站").font(.system(size: 14))
            }.tag(5)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.paperplus)
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                Text("新增約訪").font(.system(size: 14))
            }.tag(6)
            
            NavigationView {
                
            }
            .tabItem {
                Image(ImageName.document)
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                Text("新增待辦").font(.system(size: 14))
            }.tag(7)
        }
        .accentColor(Colors.green700)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(
            leading: Title(),
            trailing: Text("2023 / 12 / 11 (一) 理專 蔡立方 您好")
                .font(.system(size: 14))
        )
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
        .toolbar(.visible, for: .tabBar)
        .toolbarBackground(.white, for: .tabBar)
    }
}

#Preview {
    TabbarViewController()
}
