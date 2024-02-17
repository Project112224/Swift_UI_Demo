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

    @State var vm: LoginViewModel = .init()
    
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
                    y: 12.0 + self.getStatusBarHeight()
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

                            TextField("Account", text: $vm.account)
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
                            
                            SecureField("Password", text: $vm.password)
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
//                            let message = vm.valid(account: vm.account, password: vm.password)
//                            if message == nil {
//                                router.navigate(to: .homePage)
//                            } else {
//                                self.callAlert(message: message ?? "")
//                            }
                            DispatchQueue.main.async {
                                router.navigate(to: .homePage)
                            }
                        }) {
                            ButtonWithBackground(btnText: "LOGIN")
                        }
                        
                        Spacer(minLength: (UIScreen.main.bounds.width * 15) / 414)
                    }
                }
            }
            if (vm.showAlert) {
                CustomAlert(
                    presentAlert: $vm.showAlert,
                    alertType: .custom(
                        title: "",
                        message: vm.alertMsg,
                        rightActionText: "OK"
                    ),
                    messageColor: vm.isLock ? Color.red : Color.black,
                    rightButtonAction:  {
                        vm.alertMsg = ""
                    }
                )
            }
        }
    }
    
    
}

extension LoginViewController {
    
    fileprivate func getStatusBarHeight() -> CGFloat {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    fileprivate func callAlert(message: String) {
        vm.countErrorNumber(message: message)
        vm.showAlert.toggle()
    }
}

#Preview {
    LoginViewController()
}
