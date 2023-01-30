//
//  CustomTextStyle.swift
//  BetTips
//
//  Created by Poonam Pandey on 30/01/23.
//

import SwiftUI

struct FormLabelText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("OpenSans-Bold", size: 20))
            .foregroundColor(Color("primary"))
            .padding(4)
    }
}

struct AppLabelText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("OpenSans-Bold", size: 24))
            .foregroundColor(Color("primary"))
            .padding(4)
    }
}
