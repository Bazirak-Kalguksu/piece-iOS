import SwiftUI
import FlowKit

class MainNavigationViewModel: ObservableObject {
    @Published var selection: TabItem = .home
    
    var isSigned: Bool {
        KeyChain.read() != nil
    }
}
