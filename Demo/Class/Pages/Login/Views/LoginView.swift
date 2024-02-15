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

    @State private var account: String = ""
    @State private var password: String = ""
    @State private var alertMsg: String = ""
    @State private var showAlert: Bool = false
    @State private var statusBarHeight: CGFloat = 0
    @State private var errorCount: Int = 0
    @State private var isLock: Bool = false
    
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
                    messageColor: isLock ? Color.red : Color.black,
                    rightButtonAction:  {
                        self.alertMsg = ""
                    }
                )
            }
        }.onAppear {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        }
    }
    
    fileprivate func isValidInputs() -> Bool {
        
        if (self.errorCount >= 4) {
            self.callAlert(message: "輸入密碼錯誤第5次已鎖定，請洽管理員", _isLock: true)
            return false
        }
        
        if self.account.isEmpty || self.password.isEmpty {
            self.callAlert(message: "請輸入帳號密碼")
            return false
        }
        
        if !self.account.isValidAccount {
            self.callAlert(message: "請輸入正確帳號")
            return false
        }
        
        if !(self.password.isValidPassword) {
            self.callAlert(message: "輸入密碼錯誤")
            return false
        }
        
        return true
    }
    
    fileprivate func callAlert(message: String, _isLock: Bool = false) {
        self.isLock = _isLock
        self.alertMsg = message
        self.errorCount += 1
        self.showAlert.toggle()
    }
}

#Preview {
    LoginView()
}
