import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    PieceAsset.Icon.rank.swiftUIImage
                    
                    Text("랭킹")
                }
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    
                    Text("홈")
                }
            
            HomeView()
                .tabItem {
                    Image(systemName: "person.circle")
                    
                    Text("프로필")
                }
        }
    }
}

#Preview {
    MainTabView()
}
