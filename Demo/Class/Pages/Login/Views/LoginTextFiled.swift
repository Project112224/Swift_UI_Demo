//
//  LoginTextFiled.swift
//  Demo
//
//  Created by --- on 2024/2/17.
//

import SwiftUI

struct LoginTextFiled: View {
    
    var hintText: String
    
    var icon: String
    
    var text: Binding<String>
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Spacer()
                    Image(icon)
                        .renderingMode(.template)
                        .foregroundColor(Colors.green500)
                        .padding(.leading, (geometry.size.width * 10) / 414)
                        .frame(height: (geometry.size.width * 25) / 414)

                    TextField(hintText, text: text)
                        .frame(height: (geometry.size.width * 25) / 414, alignment: .center)
                        .padding(.leading, (geometry.size.width * 10) / 414)
                        .padding(.trailing, (geometry.size.width * 10) / 414)
                        .font(.system(size: 18, weight: .regular, design: .default))
                        .imageScale(.small)
                        .keyboardType(.emailAddress)
                        .autocapitalization(UITextAutocapitalizationType.none)
                    Spacer()
                }
                Seperator(color: Colors.green500)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    LoginTextFiled(hintText: "密碼", icon: ImageName.icPassword, text: .constant(""))
}
