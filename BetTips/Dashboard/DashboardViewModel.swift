import SwiftUI
import Combine

class DashboardViewModel: ObservableObject {
    
    @Published var dashboardForm = DashboardFormState(txtSenderMessage: "")
    
    // MARK: Loader
    @Published var showLoader = false
    
    // MARK: Init
    init(DashboardFormState: String) {
           
        }
    }



struct DashboardFormState {
    var txtSenderMessage: String = ""
}
struct DashboardLableResponse: Codable {
    var message: [String] = [""]
}
