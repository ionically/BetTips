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
            .onAppear{
                AppDelegate.orientationLock = .portrait
            }
            .navigationBarTitle("").navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true).navigationViewStyle(StackNavigationViewStyle())
            .onReceive(self.viewModel.$loginSuccess, perform: { success in
                if success == true {
                    let sceneDelegate = UIApplication.shared.connectedScenes
                        .first!.delegate as? SceneDelegate
                    sceneDelegate?.window!.rootViewController = UIHostingController(rootView: viewModel.getView())
                }
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigate(to: WebViewDemo(), when: $viewModel.showWebView)
        .navigate(to: ForgotPwdView(viewModel: .init(repo: LoginWebRepo())), when: $showingForgotPwdScreen)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: default form
extension LoginView {
    var defaultForm: some View {
            VStack {
                // MARK: logo & app name
                Spacer()
                    .frame(height: 32)
                Image("logo")
                Spacer().frame(height: 40)
                Text(LocalizedStringKey(Strings.Login.loginButton.localized(.backendDefault))).subTitleText()
                Spacer().frame(height: 20)
                Text(LocalizedStringKey(Strings.Login.appName.localized(.backendDefault))).titleText()
                Spacer()
                    .frame(height: 10)
                
                // MARK: login form
                VStack(alignment: .leading) {
                    // MARK: Username
                    Text(Strings.Login.usernameLabel.localized(.backendDefault)).buttonTextGrey()
                    
                    TextField(Strings.Login.usernamePlaceholder.localized(.backendDefault),
                              text: $viewModel.loginForm.txtUsername)
                        .font(.custom("OpenSans-SemiBold", size: 14))
                        .foregroundColor(Color(hexString: "#363E45"))
                        .frame(height: 28)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .keyboardType(.emailAddress)
                        .alert(isPresented: $viewModel.emailValidationFail) { () -> Alert in
                            Alert(title: Text(Strings.Login.emailValidateError.localized(.backendDefault)),
                                  dismissButton: .default(Text(PortalCommon.okay.localized(.backendDefault))))
                        }
                    Spacer()
                        .frame(height: 32)
                    
                    // MARK: password
                    Text(Strings.Login.passwordLabel.localized(.backendDefault))
                        .buttonTextGrey()
                    
                    SecureField(Strings.Login.passwordPlaceholder.localized(.backendDefault),
                                text: $viewModel.loginForm.txtPassword)
                        .font(.custom("OpenSans-SemiBold", size: 14))
                        .foregroundColor(Color(hexString: "#363E45"))
                        .frame(height: 28)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .alert(isPresented: $viewModel.passwordValidationFail) { () -> Alert in
                            Alert(title: Text(Strings.Login.passwordValidateError.localized(.backendDefault)),
                                  dismissButton: .default(Text(PortalCommon.okay.localized(.backendDefault))))
                        }
                    Spacer()
                        .frame(height: 32)
                    Group {
                        Spacer()
                            .frame(height: 32)
                        
                        // MARK: login button
                        Button(Strings.Login.loginButton.localized(.backendDefault), action: {
                            self.viewModel.actionBtnLogin()
                        }).portalButton(height: 56, width: 44, cornerRadius: 8)
                    }
                    Group {
                        Spacer()
                            .frame(height: 10)
                        
                        // MARK: Go to signup page
                        HStack {
                            Spacer()
                            Button(action: {
                                showingForgotPwdScreen.toggle()
                            }) {
                                HStack {
                                    Text(ForgotPwd.forgotPwd.localized(.backendDefault)).paragraphTextEldBlue16()
                                }
                            }
                            Spacer()
                        }
                    }
                    
                    if debugFlag  {
                        Spacer()
                            .frame(height: 50)
                        Text("DEBUG MODE").paragraphTextEldBlack14()
                        Text("ON").textGreen()
//                        HStack {
//                            Button(action: {
//                                viewModel.showWebView = true
//                            }) {
//                                HStack {
//                                    Text("WebView Demo").paragraphTextEldBlue16()
//                                }
//                            }
//                        }
                    }
                    
                }.padding(22)
                Spacer()
                    .alert(isPresented: $viewModel.loginFail.0) { () -> Alert in
                        return  Alert(title: Text(viewModel.loginFail.1),
                                      message: nil,
                                      dismissButton: .default(Text(PortalCommon.okay.localized(.backendDefault))))
                    }
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .init(repo: LoginWebRepo(), logout: false, assetWebRepo: AssetWebRepo()))
    }
}
