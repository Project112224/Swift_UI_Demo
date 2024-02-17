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
        GeometryReader { geometry in
            ZStack {
                Image(ImageName.imgBackgroundHome)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )

                Title()
                    .position(CGPoint(
                        x: geometry.size.width - 163.69,
                        y: 12.0 + self.getStatusBarHeight()
                    ))
                
                VStack(alignment: .center) {
                    VStack {
                        Spacer(minLength: (geometry.size.width * 15) / 414)
                        RoundedImage()
                    }
                    LoginTextFiled(
                        hintText: "Account",
                        icon: ImageName.icAccount,
                        text: $vm.account
                    ).frame(width: geometry.size.width * 0.8, height: 100)
                    
                    Spacer(minLength: (geometry.size.width * 15) / 414)
                    
                    LoginTextFiled(
                        hintText: "Password",
                        icon: ImageName.icPassword,
                        text: $vm.password
                    ).frame(width: geometry.size.width * 0.8, height: 100)
                    
                    Spacer(minLength: (geometry.size.width * 15) / 414)
                    
                    VStack {
                        Spacer().frame(height: 20)
                        Button(action: {
                            let message = vm.valid(account: vm.account, password: vm.password)
                            if message == nil {
                                router.navigate(to: .homePage)
                            } else {
                                self.callAlert(message: message ?? "")
                            }
                        }) {
                            ButtonWithBackground(btnText: "LOGIN")
                                .frame(width: geometry.size.width * 0.8, height: 40)
                        }
                        
                        Spacer(minLength: (geometry.size.width * 15) / 414)
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
