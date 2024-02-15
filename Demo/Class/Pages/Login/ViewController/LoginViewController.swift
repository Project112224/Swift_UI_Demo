//
//  LoginViewController.swift
//  Demo
//
//  Created by --- on 2024/2/15.
//

import SwiftUI

struct LoginViewController: View {
    
    @EnvironmentObject var router: Router
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    @State private var account: String = ""
    @State private var password: String = ""
    @State private var alertMsg: String = ""
    @State private var showAlert: Bool = false
    @State private var statusBarHeight: CGFloat = 0
    @State private var isLock: Bool = false
    @State private var viewModel: LoginViewModel?
    @State private var errorCount: Int = 0
    
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
                            let message = viewModel?.valid(account: self.account, password: self.password)
                            if message == nil {
                                router.navigate(to: .homePage)
                            } else {
                                self.callAlert(message: message ?? "")
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
            viewModel = LoginViewModel(errorCount: $errorCount)
        }
    }
    
    fileprivate func callAlert(message: String) {
        self.isLock = self.errorCount >= 4
        self.alertMsg = message
        self.errorCount += 1
        self.showAlert.toggle()
    }
}

#Preview {
    LoginViewController()
}
