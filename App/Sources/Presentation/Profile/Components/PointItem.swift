import SwiftUI

enum PointTitle: String {
    case point = "포인트"
    case valance = "나의 계좌"
    
    var suffix: String {
        switch self {
        case .point:
            return "P"
        case .valance:
            return "원"
        }
    }
}

struct PointItem: View {
    
    let title: PointTitle
    let value: Int
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            
            HStack {
                Text(title.rawValue)
                    .foregroundStyle(Color.black)
                
                Spacer()
                
                Text("\(value)\(title.suffix)")
                    .foregroundStyle(Color.Blue.blue700)
                
                Spacer()
                    .frame(maxWidth: 10)
                
                PieceAsset.Icon.front.swiftUIImage
                    .foregroundStyle(Color.Gray.gray500)
                
            }
            .font(.pretendard(size: 20))
            .padding(.horizontal, 12)
            .padding(.vertical, 14)
            .background(
                Color.Gray.gray100
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            )
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    PointItem(title: .point, value: 10) {
        
    }
}
