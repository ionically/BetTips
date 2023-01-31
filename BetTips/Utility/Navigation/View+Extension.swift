import SwiftUI

// MARK: - NavigateModifier
extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<SomeView: View>(to view: SomeView, when binding: Binding<Bool>) -> some View {
        modifier(NavigateModifier(destination: view, binding: binding))
    }
    
}

private struct NavigateModifier<SomeView: View>: ViewModifier {
    fileprivate let destination: SomeView
    @Binding fileprivate var binding: Bool
    fileprivate func body(content: Content) -> some View {
        ZStack {
            content
                .navigationBarTitle("")
                .navigationBarHidden(true)
            NavigationLink(destination: destination
                .navigationBarTitle("")
                .navigationBarHidden(true),
                           isActive: $binding) {
                EmptyView()
            }
        }
    }
}

