import SwiftUI
import Combine

class DashboardViewModel: ObservableObject {
    
    @Published var dashboardForm = DashboardFormState(txtSenderMessage: "")
    
    // MARK: Loader
    @Published var showLoader = false
    
    // MARK: Init
    init() {}
}


struct DashboardFormState {
    var txtSenderMessage: String = ""
}
