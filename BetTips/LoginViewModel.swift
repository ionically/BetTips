import SwiftUI
import Combine

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
            
    // MARK: Validations
    func formValidate() -> Bool {
        if !loginForm.txtUsername.isEmpty {
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
   
}

struct LoginFormState {
    var txtUsername: String = ""
    var txtPassword: String = ""
}
