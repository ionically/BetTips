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
            //LoginView(viewModel: .init())
            
            // From Local then this
//            let data = getFeedList()
//            DashboardView(viewModel: .init(data))
            
            // From Api then this
             DashboardView(viewModel: .init())
        }
    }
}
