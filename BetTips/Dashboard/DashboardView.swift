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
            .background(Color("secondary"))
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
            ScrollView {
                ForEach(0..<8, id: \.self) {index in
                    ZStack {
                        Spacer()
                        VStack {
                            Button("MESSAGE BAR"){Button("Message Bar") { print("Button tapped!") }}
                            
                            Spacer()
                            Text("You can find some `better` BETTips here...")
                            Spacer().frame(width: 4)
                            
                        }.padding([.bottom, .trailing], 4)
                        
                    }.frame(height: 56)
                    Spacer()
                }
            }.padding([.leading, .trailing], 10)
            
            // MARK: Sender Text Field
            TextField(LoginStrings.usernamePlaceholder,
                      text: $viewModel.dashboardForm.txtSenderMessage)
                 Button("Infinite chats tips"){Button("Infinite chat tips") { print("Button tapped!") }}
            TextField(LoginStrings.usernamePlaceholder,
                      text: $viewModel.dashboardForm.txtSenderMessage)
                .font(.custom("OpenSans-SemiBold", size: 30))
                .foregroundColor(Color("dashboard-row-textcolor"))
                .frame(height: 40)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color("email-field-inside"))
                )
                .keyboardType(.default)
                
            Spacer().frame(height: 6)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: .init(DashboardFormState: "Infinite tips"))
    }
}
