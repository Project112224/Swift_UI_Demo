//
//  DateControlView.swift
//  Demo
//
//  Created by Brook on 2024/2/7.
//

import SwiftUI

struct DateControlView: View {
    
    @State private var selectedDate = Date()
    
    var body: some View {
        HStack {
            
            Button(action: {
                self.selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: self.selectedDate) ?? self.selectedDate

            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .background(Color.clear)
            }
            .buttonStyle(BorderlessButtonStyle())
            .accessibilityIdentifier("date_left")
            
            ZStack {
                Text(dateFormat())
                    .font(.system(size: 14))
                DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                    .environment(\.locale, Locale(identifier: "zh_Hant_TW"))
                    .labelsHidden()
                    .colorInvert()
                    .colorMultiply(.clear)
                    .padding()
                    .onChange(of: self.selectedDate) {
                        print(self.selectedDate)
                    }
            }.frame(width: 150)
            
            Button(action: {
                self.selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: self.selectedDate) ?? self.selectedDate

            }) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
                    .background(Color.clear)
            }
            .buttonStyle(BorderlessButtonStyle())
            .accessibilityIdentifier("date_right")
        }
    }
    
    func dateFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd / MM / yyyy"
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: selectedDate)
        let weekday = self.weekName(number: dateComponents.weekday!)
        return "\(formatter.string(from: selectedDate)) (\(weekday))"
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
    DateControlView()
}
