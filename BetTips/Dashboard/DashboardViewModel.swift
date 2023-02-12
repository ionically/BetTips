import SwiftUI
import Combine

class DashboardViewModel: ObservableObject {
    
    @Published var dashboardForm = DashboardFormState(txtSenderMessage: "")
    
    // MARK: Loader
//    @Published var showLoader = false
    @Published var list = [FeedItem]()
    
    private let httpClient: HTTPClient
    private var disposables = Set<AnyCancellable>()
    
    // MARK: Init
    init() {
        self.httpClient = FeedListApi()
    }
    
    init(_ data: [FeedItem]) {
        self.list = data
        self.httpClient = FeedListApi()
    }
    
    func updateList() {
        httpClient.getFeedList()
            .receive(on: DispatchQueue.main)
            .sink { value in
//                self.showLoader = false
                switch value {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { response in
                self.list = response.feedList
            }.store(in: &disposables)
    }
}


struct DashboardFormState {
    var txtSenderMessage: String = ""
}
