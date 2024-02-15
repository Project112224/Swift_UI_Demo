//
//  LoginViewModel.swift
//  Demo
//
//  Created by --- on 2024/2/15.
//

import SwiftUI

struct LoginViewModel {
    
    @Binding var errorCount: Int
    
    func valid(account: String, password: String) -> String? {
        
        if (self.errorCount >= 4) {
            return "輸入密碼錯誤第5次已鎖定，請洽管理員"
        }
        
        if account.isEmpty || password.isEmpty {
            return "請輸入帳號密碼"
        }
        
        if !account.isValidAccount {
            return "請輸入正確帳號"
        }
        
        if !(password.isValidPassword) {
            return "輸入密碼錯誤"
        }
        
        return nil
    }
    
}
