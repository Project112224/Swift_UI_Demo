//
//  TabbarViewController.swift
//  Demo
//
//  Created by Brook on 2024/2/7.
//

import SwiftUI

struct TabbarViewController: View {
    
    @State private var vm: TabbarViewModel = .init()
    
    var body: some View {
        TabView(selection: $vm.selectedView) {
            HomeViewController().tag(0)
                .ignoresSafeArea(.all, edges: [.bottom])
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
            leading: Header(),
            trailing: Text("\(self.dateFormat()) 理專 蔡立方 您好").font(.system(size: 14))
        )
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
        .toolbarColorScheme(.none, for: .tabBar)
        .toolbarBackground(.hidden, for: .tabBar)
        .toolbarBackground(.clear, for: .tabBar)
        .onAppear {
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().isTranslucent = true
            UINavigationBar.appearance().tintColor = .black
            UINavigationBar.appearance().backgroundColor = .clear
            UITabBar.appearance().backgroundColor = .clear
            UITabBar.appearance().barTintColor = .clear
            let appearance = UITabBarAppearance()
            appearance.configureWithTransparentBackground()
            UITabBar.appearance().standardAppearance = appearance
        }

        ZStack {
            GeometryReader { geometry in
                HStack(spacing: (geometry.size.width * 41.71) / 820) {
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            vm.selectedView = item.rawValue
                        } label: {
                            CustomTabItem(
                                imageName: item.iconName,
                                title: item.title,
                                isActive: (vm.selectedView == item.rawValue)
                            )
                        }
                    }
                }
                .frame(width: geometry.size.width)
            }
        }.background(.clear)
            .frame(height: 80)
    }
}

extension TabbarViewController {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        VStack(spacing: 10) {
            
            Rectangle()
                .frame(width: 40, height: 4)
                .foregroundColor(isActive ? Colors.greenLine : .clear)
            
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
    
    func dateFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd / MM / yyyy"
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: .now)
        let weekday = self.weekName(number: dateComponents.weekday!)
        return "\(formatter.string(from: .now)) (\(weekday))"
    }
    
    func weekName(number: Int) -> String {
        switch (number) {
        case 1: return "日"
        case 2: return "一"
        case 3: return "二"
        case 4: return "三"
        case 5: return "四"
        case 6: return "五"
        case 7: return "六"
        default: return ""
        }
    }
}

#Preview {
    TabbarViewController()
}
