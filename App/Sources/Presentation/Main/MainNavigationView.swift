import SwiftUI
import Moya
import FlowKit

struct MainNavigationView: View {
    @Flow var flow
    @State var isSign: Bool = false
    
    var body: some View {
        if isSign {
            HomeView()
        }
        else {
            SigninView()

        }
    }
}

#Preview {
    FlowPresenter(rootView: MainNavigationView())
}
