import SwiftUI

enum TopMedal {
    case gold, silver, bronze
    
    var image: Image {
        switch self {
        case .gold:
            PieceAsset.Icon.rankGold.swiftUIImage
        case .silver:
            PieceAsset.Icon.rankSilver.swiftUIImage
        case .bronze:
            PieceAsset.Icon.rankBronze.swiftUIImage
        }
    }
}

struct TopRank: View {
    
    let medal: TopMedal
    let name: String
    let point: Int
    
    var body: some View {
        VStack {
            PieceAsset.Icon.profile.swiftUIImage
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(Color.Blue.blue500)
                .padding(4)
                .overlay {
                    medal.image
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
            
            Text(name)
                .font(.pretendard(size: 15))
                .foregroundStyle(Color.Blue.blue700)
            
            Text("\(point) P")
                .font(.pretendard(size: 16, weight: .w800))
                .foregroundStyle(Color.Blue.blue650)
        }
    }
}

#Preview {
    TopRank(medal: .gold, name: "권수현", point: 120000)
}
