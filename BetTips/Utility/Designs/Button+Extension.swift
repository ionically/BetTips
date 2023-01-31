import SwiftUI
extension Button {
    func formButton(height: Int, width: Int, cornerRadius: Int, color: String = "#18181A",foregroundColor:Color = .orange) -> some View {
        self.buttonStyle( CustomButton(height, width, cornerRadius, color, foregroundColor))
    }
    
}
