import SwiftUI
struct BorderButton: ButtonStyle {
    var height, width, cornerRadius: Int
    
    init(_ height: Int, _  width: Int, _  cornerRadius: Int) {
        self.height = height
        self.width = width
        self.cornerRadius = cornerRadius
    }
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.custom("OpenSans-SemiBold", size: 14))
            .foregroundColor(Color("secondary"))
            .padding(20)
            .frame(width: UIScreen.main.bounds.width - CGFloat(width), height: CGFloat(height))
            .overlay(
                RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
                .stroke(Color("secondary"))
               
        )
    }
}
