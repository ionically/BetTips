import SwiftUI
import Combine

class DashboardViewModel: ObservableObject {
    
    @Published var dashboardForm = DashboardFormState(txtSenderMessage: "")
    
    // MARK: Loader
    @Published var showLoader = false
    @Published var list = [FeedItem]()
    // MARK: Init
    init(_ data: [FeedItem]) {
        self.list = data
    }
}


struct DashboardFormState {
    var txtSenderMessage: String = ""
}
