import SwiftUI

struct RankCell: View {
    let id: Int
    let name: String
    let point: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Text("\(id)")
                .font(.pretendard(size: 32, weight: .w600))
                .foregroundStyle(Color.Blue.blue500)

            
            Spacer()
            
            PieceAsset.Icon.profile.swiftUIImage
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color.Blue.blue500)
            
            Text(name)
                .font(.pretendard(size: 13))
            
            Spacer()
            
            Text("\(point) P")
                .font(.pretendard(size: 16, weight: .w800))
        }
        .padding(20)
        .background(Color.Gray.gray100.clipShape(RoundedRectangle(cornerRadius: 15)))
        .padding(.horizontal, 24)
    }
}

#Preview {
    RankCell(id: 523, name: "신민호", point: 89000)
}
