import SwiftUI
import FlowKit

struct MainNavigationView: View {
    @Flow var flow
    
    @StateObject var mainVM = MainNavigationViewModel()
    
    var body: some View {
        Group {
            if mainVM.isSigned {
                MainTabView()
            }
            else {
                SigninView()
            }
        }
        .environmentObject(mainVM)
       
        
    }
}
