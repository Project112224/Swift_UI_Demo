//
//  LoginView.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var router: Router
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    @State var account: String = ""
    @State var password: String = ""
    @State var alertMsg = ""
    @State var showAlert = false
    @State private var statusBarHeight: CGFloat = 0
    
    var body: some View {
        ZStack {
            
            Image(ImageName.imgBackgroundHome)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )

            Title()
                .position(CGPoint(
                    x: UIScreen.main.bounds.width - 163.69,
                    y: 12.0 + statusBarHeight
                ))
            
            VStack {
                VStack {
                    VStack {
                        Spacer(minLength: (UIScreen.main.bounds.width * 15) / 414)
                        RoundedImage()
                    }
                    VStack {
                        HStack {
                            Image(ImageName.icAccount)
                                .renderingMode(.template)
                                .foregroundColor(Colors.green500)
                                .padding(.leading, (UIScreen.main.bounds.width * 20) / 414)
                                .frame(height: (UIScreen.main.bounds.width * 40) / 414)

                            TextField("Account", text: $account)
                                .frame(height: (UIScreen.main.bounds.width * 40) / 414, alignment: .center)
                                .padding(.leading, (UIScreen.main.bounds.width * 10) / 414)
                                .padding(.trailing, (UIScreen.main.bounds.width * 10) / 414)
                                .font(.system(size: (UIScreen.main.bounds.width * 15) / 414, weight: .regular, design: .default))
                                .imageScale(.small)
                                .keyboardType(.emailAddress)
                                .autocapitalization(UITextAutocapitalizationType.none)
                        }
                        Seperator(color: Colors.green500)
                    }.frame(width: UIScreen.main.bounds.width * 0.8)
                    
                    Spacer(minLength: (UIScreen.main.bounds.width * 15) / 414)
                    
                    VStack {
                        HStack {
                            Image(ImageName.icPassword)
                                .renderingMode(.template)
                                .foregroundColor(Colors.green500)
                                .padding(.leading, (UIScreen.main.bounds.width * 15) / 414)
                                .frame(height: (UIScreen.main.bounds.width * 40) / 414)
                            
                            SecureField("Password", text: $password)
                                .frame(height: (UIScreen.main.bounds.width * 40) / 414, alignment: .center)
                                .padding(.leading, (UIScreen.main.bounds.width * 10) / 414)
                                .padding(.trailing, (UIScreen.main.bounds.width * 10) / 414)
                                .font(.system(size: (UIScreen.main.bounds.width * 15) / 414, weight: .regular, design: .default))
                                .imageScale(.small)
                        }
                        Seperator(color: Colors.green500)
                    }.frame(width: UIScreen.main.bounds.width * 0.8)
                    
                    Spacer(minLength: (UIScreen.main.bounds.width * 15) / 414)
                    
                    VStack {
                        Spacer().frame(height: 20)
                        Button(action: {
                            if  self.isValidInputs() {
                                router.navigate(to: .homePage)
                            }
                        }) {
                            ButtonWithBackground(btnText: "LOGIN")
                        }
                        
                        Spacer(minLength: (UIScreen.main.bounds.width * 15) / 414)
                    }
                }
            }
            if (showAlert) {
                CustomAlert(
                    presentAlert: $showAlert,
                    alertType: .custom(
                        title: "", 
                        message: self.alertMsg,
                        rightActionText: "OK"
                    ),
                    rightButtonAction:  {
                    withAnimation{
                        showAlert.toggle()
                    }
                })
            }
        }.onAppear {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        }
    }
    
    fileprivate func isValidInputs() -> Bool {
        var isEmpty = false
        
        if self.account.isEmpty || self.password.isEmpty {
            self.alertMsg = "請輸入帳號密碼"
            self.showAlert.toggle()
            return false
        }
        
        if !self.account.isValidAccount {
            self.alertMsg = "請輸入正確帳號"
            self.showAlert.toggle()
            return false
        }
        
        if !(self.password.isValidPassword) {
            self.alertMsg = "輸入密碼錯誤"
            self.showAlert.toggle()
            return false
        }
        
        return true
    }
    
}

#Preview {
    LoginView()
}
