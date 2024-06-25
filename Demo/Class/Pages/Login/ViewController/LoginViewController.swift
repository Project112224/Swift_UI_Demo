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
    
    @ViewBuilder
    var baseView: some View {
        ZStack {}
    }
    
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

                Header()
                    .position(CGPoint(
                        x: geometry.size.width - 103.69,
                        y: 12.0 + self.getStatusBarHeight()
                    ))
                    .onTapGesture {
                        hideKeyboard()
                    }
                
                Color(white: 0, opacity: 0.0001)
                    .onTapGesture {
                        hideKeyboard()
                    }
                
                VStack(alignment: .center) {
                    VStack {
                        Spacer(minLength: (geometry.size.width * 15) / 414)
                        RoundedImage()
                            .onTapGesture {
                                hideKeyboard()
                            }
                    }
                    
                    LoginTextFiled(
                        hintText: "Account",
                        icon: ImageName.icAccount,
                        text: $vm.account
                    ).frame(height: geometry.size.height / 20)
                    
                    Spacer(minLength: (geometry.size.width * 15) / 414)
                    
                    LoginTextFiled(
                        hintText: "Password",
                        icon: ImageName.icPassword,
                        text: $vm.password
                    ).frame(height: geometry.size.height / 20)
                    
                    Spacer(minLength: (geometry.size.width * 15) / 414)
                    
                    VStack {
                        Spacer()
                        Button(action: {
                            let message = vm.valid(account: vm.account, password: vm.password)
                            if message == nil {
                                router.navigate(to: .homePage)
                            } else {
                                self.callAlert(message: message ?? "")
                            }
                        }) {
                            ButtonWithBackground(btnText: "LOGIN")
                                .frame(height: 40)
                        }
                        Spacer()
                    }
                }.frame(
                    width: vm.renderInputHeight(length: geometry.size.width * 0.65),
                    height: geometry.size.height * 0.6
                )
                
                if (vm.showAlert) {
                    CustomAlert(
                        presentAlert: $vm.showAlert,
                        alertType: .custom(
                            title: "",
                            message: vm.alertMessage,
                            rightActionText: "OK"
                        ),
                        messageColor: vm.isLock ? Color.red : Color.black,
                        rightButtonAction:  {
                            vm.alertMessage = ""
                        }
                    )
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

extension LoginViewController {
    
    fileprivate func getStatusBarHeight() -> CGFloat {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    fileprivate func callAlert(message: String) {
        vm.renderError(message: message)
        vm.showAlert.toggle()
    }
    
#if canImport(UIKit)
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
#endif

}

#Preview {
    LoginViewController()
}
