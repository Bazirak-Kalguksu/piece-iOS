import SwiftUI

struct HomeView: View {
    var body: some View {
        
        PieceAsset.Icon.profile.swiftUIImage
            .resizable()
            .frame(width: 100, height: 100)
    }
}

#Preview {
    HomeView()
}
