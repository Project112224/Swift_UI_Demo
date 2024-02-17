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
        UITabBar.appearance().backgroundColor = .clear
        UITabBar.appearance().barTintColor = .clear
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
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(
            leading: Title(),
            trailing: Text("2023 / 12 / 11 (一) 理專 蔡立方 您好").font(.system(size: 14))
        )
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
        .toolbarColorScheme(.none, for: .tabBar)
        .toolbarBackground(.hidden, for: .tabBar)
        .toolbarBackground(.clear, for: .tabBar)

        ZStack {
            HStack(spacing: (UIScreen.main.bounds.width * 41.71) / 820) {
                ForEach((TabbedItems.allCases), id: \.self){ item in
                    Button{
                        selectedView = item.rawValue
                    } label: {
                        CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedView == item.rawValue))
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }.background(.clear)
    }
}

extension TabbarViewController {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        VStack(spacing: 10) {
            if (isActive) {
                Rectangle()
                    .frame(width: 40, height: 4)
                    .foregroundColor(Colors.greenLine)
                
            }
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? Colors.green700 : Colors.unselectedItemTintColor)
                .frame(width: 24, height: 24)
            
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(isActive ? Colors.green700 : Colors.unselectedItemTintColor)
        }.frame(minWidth: 58, minHeight: 64)
    }
}

#Preview {
    TabbarViewController()
}
