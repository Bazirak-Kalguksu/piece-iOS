import SwiftUI
import FlowKit

@main
struct PieceApp: App {
    var body: some Scene {
        WindowGroup {
            FlowPresenter(rootView: MainNavigationView())
        }
    }
}
