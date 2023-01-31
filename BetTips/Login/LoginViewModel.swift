import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    
    // MARK: View state
    @Published var loginForm = LoginFormState(txtEmail: "")
    
    // MARK: Show Dashboard
    @Published var showDashboard = false
    
    // MARK: Errors
    @Published var emailValidationFail = false
    @Published var passwordValidationFail = false
    @Published var loginFail = false
    
    // MARK: Loader
    @Published var showLoader = false
    
    // MARK: Init
    init() {}
            
    // MARK: Validations
    func formValidate() -> Bool {
        if loginForm.txtEmail.isEmpty {
            emailValidationFail = true
            return false
        }
        return true
    }
    
    // MARK: Login Button clicked
    func login() {
        // we will uncomment this below line when
        // api will be called on login button
        // formValidate()
//        //Login Button
//                  Button(
//                      action:
//                      {
//                      // Open Signup Screen
//                          Signup();
//                      },
//                      label:
//                      {
//                      // How the button looks li
//                      Text("Create New Account")
//                      .foregroundColor(.white)
//                      .font(.title)
//                      }
//                      )
//                      .frame(maxWidth: .infinity, alignment: .center)
//                      .background(Color(red: 0.22, green: 0.655, blue: 0.02))
//                      .cornerRadius(8)
//                      .padding(.horizontal, metrics.size.width*0.10)
//
              }
        
//        showDashboard = true
    }
    

struct LoginFormState {
    var txtEmail: String = ""
}
