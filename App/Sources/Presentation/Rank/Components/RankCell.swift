import SwiftUI

struct RankCell: View {
    var body: some View {
        HStack(spacing: 20) {
            Text("4")
                .font(.pretendard(size: 32, weight: .w600))
                .foregroundStyle(Color.Blue.blue500)

            
            Spacer()
            
            PieceAsset.Icon.profile.swiftUIImage
                .resizable()
                .frame(maxWidth: 48, maxHeight: 48)
                .foregroundStyle(Color.Blue.blue500)
            
            Text("권수현")
            
            Spacer()
            
            Text("89,000 P")
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    RankCell()
}
