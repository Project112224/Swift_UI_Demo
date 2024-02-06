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

    @State var email: String = ""
    @State var password: String = ""
    @State var alertMsg = ""
    @State var showAlert = false
    @State var mailLineColor = Colors.green500
    @State var pwLineColor = Colors.green500

    var body: some View {
        ZStack {
            
            Image("img_background_home")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )

            VStack {
                VStack {
                    VStack {
                        Spacer(minLength: (UIScreen.main.bounds.width * 15) / 414)
                        RoundedImage()
                    }
                    VStack {
                        HStack {
                            Image("ic_email")
                                .renderingMode(.template)
                                .foregroundColor(Colors.green500)
                                .padding(.leading, (UIScreen.main.bounds.width * 20) / 414)
                            
                            TextField("Email", text: $email)
                                .frame(height: (UIScreen.main.bounds.width * 40) / 414, alignment: .center)
                                .padding(.leading, (UIScreen.main.bounds.width * 10) / 414)
                                .padding(.trailing, (UIScreen.main.bounds.width * 10) / 414)
                                .font(.system(size: (UIScreen.main.bounds.width * 15) / 414, weight: .regular, design: .default))
                                .imageScale(.small)
                                .keyboardType(.emailAddress)
                                .autocapitalization(UITextAutocapitalizationType.none)
                        }
                        Seperator(color: mailLineColor)
                    }
                    Spacer(minLength: (UIScreen.main.bounds.width * 15) / 414)
                    VStack {
                        HStack {
                            Image("ic_password")
                                .renderingMode(.template)
                                .foregroundColor(Colors.green500)
                                .padding(.leading, (UIScreen.main.bounds.width * 20) / 414)
                            
                            SecureField("Password", text: $password)
                                .frame(height: (UIScreen.main.bounds.width * 40) / 414, alignment: .center)
                                .padding(.leading, (UIScreen.main.bounds.width * 10) / 414)
                                .padding(.trailing, (UIScreen.main.bounds.width * 10) / 414)
                                .font(.system(size: (UIScreen.main.bounds.width * 15) / 414, weight: .regular, design: .default))
                                .imageScale(.small)
                        }
                        Seperator(color: pwLineColor)
                        
                    }
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
        }
    }
    
    fileprivate func isValidInputs() -> Bool {
        var isEmpty = false
        
        if self.email == "" {
            self.mailLineColor = Color.red
            isEmpty = isEmpty || true
        } else {
            self.mailLineColor = Colors.green500
        }
        
        if self.password == "" {
            self.pwLineColor = Color.red
            isEmpty = isEmpty || true
        } else {
            self.pwLineColor = Colors.green500
        }
        
        if (isEmpty) {
            return false
        }
        
        if !self.email.isValidEmail {
            self.alertMsg = "Email is not valid."
            self.showAlert.toggle()
            return false
        } else if !(self.password.isValidPassword) {
            self.alertMsg = "Please enter valid password"
            self.showAlert.toggle()
            return false
        }
        
        return true
    }
    
}

#Preview {
    LoginView()
}
