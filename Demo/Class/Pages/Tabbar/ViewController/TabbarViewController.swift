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
            
            HomeViewController().tag(0)
            
            EmptyView().tag(1)
            EmptyView().tag(2)
            EmptyView().tag(3)
            EmptyView().tag(4)
            EmptyView().tag(5)
            EmptyView().tag(6)
            EmptyView().tag(7)
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
        
        ZStack{
            HStack{
                ForEach((TabbedItems.allCases), id: \.self){ item in
                    Button{
                        selectedView = item.rawValue
                    } label: {
                        CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedView == item.rawValue))
                    }
                }
            }
            .padding(6)
        }
    }
}

#Preview {
    TabbarViewController()
}
