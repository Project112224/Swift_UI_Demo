//
//  LoginView.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var router: Router
    
    @State var email: String = ""
    @State var password: String = ""
    @State var alertMsg = ""
    
    @State private var showForgotPassword = false
    @State private var showSignup = false
    @State var showAlert = false
    @State var showDetails = false
    
    @State var loginSelection: Int? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var alert: Alert {
        Alert(title: Text(""), message: Text(alertMsg), dismissButton: .default(Text("OK")))
    }
    
    var body: some View {
        ZStack {
            
            Image("img_background_home")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

            VStack {
                VStack {
                    VStack {
                        Spacer(minLength: (UIScreen.main.bounds.width * 15) / 414)
                        RoundedImage()
                    }
                    VStack {
                        HStack {
                            Image("ic_email")
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
                        Seperator()
                    }
                    Spacer(minLength: (UIScreen.main.bounds.width * 15) / 414)
                    VStack {
                        HStack {
                            Image("ic_password")
                                .padding(.leading, (UIScreen.main.bounds.width * 20) / 414)
                            
                            SecureField("Password", text: $password)
                                .frame(height: (UIScreen.main.bounds.width * 40) / 414, alignment: .center)
                                .padding(.leading, (UIScreen.main.bounds.width * 10) / 414)
                                .padding(.trailing, (UIScreen.main.bounds.width * 10) / 414)
                                .font(.system(size: (UIScreen.main.bounds.width * 15) / 414, weight: .regular, design: .default))
                                .imageScale(.small)
                        }
                        Seperator()
                        
                    }
                    Spacer(minLength: (UIScreen.main.bounds.width * 15) / 414)
                    VStack {
                        Button(action: {
//                            if  self.isValidInputs() {
//                                UserDefaults.standard.set(true, forKey: "Loggedin")
//                                UserDefaults.standard.synchronize()
//                            }
                            router.navigate(to: .homePage)
                        }) {
                            ButtonWithBackground(btnText: "LOGIN")
                        }.background(.red)
                        
                        Spacer(minLength: (UIScreen.main.bounds.width * 15) / 414)
                    }
                }
                .alert(isPresented: $showAlert, content: { self.alert })
            }
        }
    }
    
    fileprivate func isValidInputs() -> Bool {
        
        if self.email == "" {
            self.alertMsg = "Email can't be blank."
            self.showAlert.toggle()
            return false
        } else if !self.email.isValidEmail {
            self.alertMsg = "Email is not valid."
            self.showAlert.toggle()
            return false
        } else if self.password == "" {
            self.alertMsg = "Password can't be blank."
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
