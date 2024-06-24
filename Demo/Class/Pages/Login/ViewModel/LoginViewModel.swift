//
//  LoginViewModel.swift
//  Demo
//
//  Created by --- on 2024/2/15.
//

import SwiftUI


extension LoginViewController {
    
    @Observable
    class LoginViewModel {
        var errorCount: Int = 0
        var showAlert: Bool = false
        var account: String = ""
        var password: String = ""
        var alertMsg: String = ""
        var isLock: Bool = false
        
        func renderInputHeight(length: Double) -> Double {
            return length < 320 ? 320 : length
        }
        
        func valid(account: String, password: String) -> String? {
            
            if (self.errorCount >= 4) {
                return "輸入錯誤第5次已鎖定，請洽管理員"
            }
            
            if account.isEmpty || password.isEmpty {
                return "請輸入帳號密碼"
            }
            
            if !account.isValidAccount {
                return "帳號或密碼錯誤"
            }
            
            if !(password.isValidPassword) {
                return "帳號或密碼錯誤"
            }
            
            return nil
        }
        
        func countErrorNumber(message: String) {
            self.isLock = self.errorCount >= 4
            self.errorCount += 1
            self.alertMsg = message
        }
    }
    
}
