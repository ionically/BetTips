//
//  Text+Extension.swift
//  BetTips
//
//  Created by Poonam Pandey on 30/01/23.
//

import SwiftUI
extension Text {
    func formLabels() -> some View {
        self.modifier(FormLabelText())
    }
    func appLabels() -> some View {
        self.modifier(AppLabelText())
    }
}
