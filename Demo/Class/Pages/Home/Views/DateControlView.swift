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
            
            DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                        .environment(\.locale, Locale(identifier: "zh_Hant_TW"))
                        .labelsHidden()
                        .padding()
                        .onChange(of: self.selectedDate) {
                            print(self.selectedDate)
                        }
            
            Button(action: {
                self.selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: self.selectedDate) ?? self.selectedDate

            }) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
                    .background(Color.clear)
            }
            .buttonStyle(BorderlessButtonStyle())
            
        }
    }
    
}

#Preview {
    DateControlView()
}
