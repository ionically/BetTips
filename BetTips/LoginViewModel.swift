//
//  LoginViewModel.swift
//  Asset Tracker


import SwiftUI
import Combine

extension LoginView {
    
    class LoginViewModel: ObservableObject {
        
        // MARK: Must have
        
        
        // MARK: View state
        @Published var loginForm = LoginFormState(txtUsername: "", txtPassword: "")
        
        
        @Published var checkBox = false
        
        // MARK: Errors
        @Published var emailValidationFail = false
        @Published var passwordValidationFail = false
        @Published var loginFail = (false, "")
        
        
        // MARK: Loader
        @Published var showLoader = false
        
        // MARK: Init
        
        init() {}
        
        
        // MARK: User actions
        
        // MARK: Validations
        func formValidate() -> Bool {
            if loginForm.txtUsername.isnotEmpty {
                if !loginForm.txtPassword.isEmpty {
                    return true
                } else {
                    passwordValidationFail = true
                    return false
                }
            } else {
                emailValidationFail = true
                return false
            }
        }
        
        // MARK: API
        func login() {}
        
        // MARK: Form
        extension LoginView {
            struct LoginFormState {
                var txtUsername: String = ""
                var txtPassword: String = ""
            }
        }
        
        
    }
}
