import SwiftUI

struct DashboardView: View {

    @ObservedObject private(set) var viewModel: DashboardViewModel
    @State private var showingForgotPwdScreen = false
    var body: some View {
        NavigationStack {
            ZStack {
                defaultForm
              // if viewModel.showLoader {
             //    LoaderView()
             //   }
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
                    HStack {
                        VStack {}
                        Text("Circle")
                            .background(Color.yellow)
                            .frame(width: 10)
                        
                        HStack {}
                        Text("Gambling State")
                        Text("Texas")
                        Text("I am betting but not as much")
                        Text("@everyone")
                            .foregroundColor(Color.gray)
                        
                        VStack {}
                            .border(Color.red)
                        
                    }.frame(height: 56)
                        .background(Color("dashboard-tip-background"))
                  //  Spacer()
                }
            }.padding([.leading, .trailing], 10)
            Text(viewModel.dashboardForm.txtSenderMessage)
                .foregroundColor(.white)
            // MARK: Sender Text Field
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
