import SwiftUI
import FlowKit

enum TabItem: String {
    case rank = "랭킹"
    case home = "홈"
    case profile = "프로필"

}

struct MainTabView: View {
    @Flow var flow
    @EnvironmentObject var mainVM: MainNavigationViewModel

    var body: some View {
        
        TabView(selection: $mainVM.selection) {
            
            RankView()
                .tabItem {
                    PieceAsset.Icon.rank.swiftUIImage
                    
                    Text("랭킹")
                }
                .tag(TabItem.rank)
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    
                    Text("홈")
                }
                .tag(TabItem.home)

            
            ProfileView()
                
                .tabItem {
                    Image(systemName: "person.circle")
                    
                    Text("프로필")
                }
                .tag(TabItem.profile)

        }
        .environmentObject(mainVM)

    }
}

#Preview {
    MainTabView()
}
