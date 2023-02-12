//
//  BetTipsApp.swift
//  BetTips
//
//  Created by chandni chaudhari on 30/01/23.
//

import SwiftUI

@main
struct BetTipsApp: App {
    var body: some Scene {
        WindowGroup {
//            LoginView(viewModel: .init())
            let data = getFeedList()
            DashboardView(viewModel: .init(data))
        }
    }
}
