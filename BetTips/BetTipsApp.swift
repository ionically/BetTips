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
            
            /**
             If you want to see the list from the json-data json file
             then remove comments from line 20 & 21
             and add comments to line 26
            */
            
//            let data = getFeedList()
//            DashboardView(viewModel: .init(data))
            
            // From Api then this
             DashboardView(viewModel: .init())
        }
    }
}
