import SwiftUI

struct DashboardView: View {

    @ObservedObject private(set) var viewModel: DashboardViewModel
    @State private var showingForgotPwdScreen = false
    var body: some View {
        NavigationStack {
            ZStack {
                defaultForm
                if viewModel.showLoader {
                    LoaderView()
                }
            }
            .background(Color("foreground-textedit"))
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear {}
            .navigationBarTitle("").navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true).navigationViewStyle(StackNavigationViewStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: default form
extension DashboardView {
    var defaultForm: some View {
        VStack {
            TipsList()
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity)
            
            Text(viewModel.dashboardForm.txtSenderMessage)
                .foregroundColor(Color.white)
            // MARK: Sender Text Field
            TextField(LoginStrings.usernamePlaceholder,
                      text: $viewModel.dashboardForm.txtSenderMessage)
                .font(.custom("OpenSans-SemiBold", size: 20))
                .foregroundColor(Color("primary-light"))
                .frame(height: 28)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color("email-field-inside"))
                )
                .keyboardType(.default)
                
            Spacer().frame(height: 5)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: .init())
    }
}
