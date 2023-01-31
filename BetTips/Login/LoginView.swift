//
//  LoginView.swift
//  Asset Tracker
//

import SwiftUI

struct LoginView: View {

    @ObservedObject private(set) var viewModel: LoginViewModel
    @State private var showingForgotPwdScreen = false
    var body: some View {
        NavigationView {
            ZStack {
                defaultForm
                if viewModel.showLoader {
                    LoaderView()
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear {}
            .navigationBarTitle("").navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true).navigationViewStyle(StackNavigationViewStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: default form
extension LoginView {
    var defaultForm: some View {
            VStack {
                // MARK: logo & app name
                Spacer().frame(height: 80)
                Text(LoginStrings.appName).appLabels()
                Spacer()
                    .frame(height: 10)
                
                // MARK: login form
                VStack(alignment: .leading) {
                    // MARK: Username
                    Text(LoginStrings.usernamePlaceholder).formLabels()
                    
                    TextField(LoginStrings.usernamePlaceholder,
                              text: $viewModel.loginForm.txtEmail)
                        .font(.custom("OpenSans-SemiBold", size: 14))
                        .foregroundColor(Color("foreground-textedit"))
                        .frame(height: 28)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .keyboardType(.emailAddress)
                        .alert(isPresented: $viewModel.emailValidationFail) { () -> Alert in
                            Alert(title: Text(LoginStrings.emailValidateError),
                                  dismissButton: .default(Text(CommonStrings.okay)))
                        }
                    Spacer()
                        .frame(height: 32)
                    
                    // MARK: password
                    Text(LoginStrings.passwordLabel)
                        .formLabels()
                    
                    SecureField(LoginStrings.passwordPlaceholder,
                                text: $viewModel.loginForm.txtPassword)
                        .font(.custom("OpenSans-SemiBold", size: 14))
                        .foregroundColor(Color("foreground-textedit"))
                        .frame(height: 28)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .alert(isPresented: $viewModel.passwordValidationFail) { () -> Alert in
                            Alert(title: Text(LoginStrings.passwordValidateError),
                                  dismissButton: .default(Text(CommonStrings.okay)))
                        }
                    Spacer()
                        .frame(height: 32)
                    Group {
                        Spacer()
                            .frame(height: 32)
                        
                    
                        
                        // MARK: login button
                        Button(LoginStrings.loginButton, action: {
                            self.viewModel.login()
                        }).borderButton(height: 56, width: 44, cornerRadius: 30)
                    
                    }
                    Group {
                        Spacer()
                            .frame(height: 10)
                        
                    }
                    
                }.padding(22)
                Spacer()
                    .alert(isPresented: $viewModel.loginFail) { () -> Alert in
                        return  Alert(title: Text("Log in failed"),
                                      message: nil,
                                      dismissButton: .default(Text(CommonStrings.okay)))
                    }
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .init())
    }
}
