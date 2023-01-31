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
                ForEach(0..<10, id: \.self) {index in
                    VStack {
                        Spacer()
                        HStack {
                            Text("Title")
                            Spacer()
                            Text("Subtitle")
                            Spacer().frame(width: 4)
                        }.padding([.leading, .trailing], 4)
                        
                    }.frame(height: 56)
                    Spacer()
                }
            }.padding([.leading, .trailing], 10)
            
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
