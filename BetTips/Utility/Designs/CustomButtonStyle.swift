import SwiftUI
struct CustomButton: ButtonStyle {
    var height, width, cornerRadius: Int
    var color: String
    var foregroundColor:Color
    init(_ height: Int, _  width: Int, _  cornerRadius: Int, _ color: String, _ foregroundColor:Color = .white) {
        self.height = height
        self.width = width
        self.cornerRadius = cornerRadius
        self.color = color
        self.foregroundColor = foregroundColor
    }
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.custom("OpenSans-SemiBold", size: 14))
            .foregroundColor(foregroundColor)
            .padding(20)
            .frame(width: UIScreen.main.bounds.width - CGFloat(width), height: CGFloat(height))
            .background(
                RoundedRectangle(cornerRadius: CGFloat(cornerRadius), style: .continuous)
                    .foregroundColor(Color(hexString: color))
            )
    }
}
