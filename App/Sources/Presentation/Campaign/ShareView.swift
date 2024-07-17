import SwiftUI

enum ShareType: Int, CaseIterable {
    case insta = 0, message
    
    var image: Image {
        switch self {
        case .insta:
            PieceAsset.Vector.instagram.swiftUIImage
        case .message:
            PieceAsset.Vector.message.swiftUIImage
        }
    }
    
    var name: String {
        switch self {
        case .insta:
            "인스타그램"
        case .message:
            "메시지"
        }
    }
}

struct ShareView: View {
    
    let type: ShareType
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal) {
                HStack(spacing: 24) {
                    ForEach(ShareType.allCases, id: \.self) { type in
                        VStack {
                            type.image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            Text(type.name)
                                .font(.pretendard(size: 12))
                        }
                    }
                    
                }
                
            }
            .padding(.horizontal, 26)
            
            Spacer()
            
            Rectangle()
                .foregroundStyle(Color.Gray.gray350)
                .frame(height: 1)
            
            Spacer()
            
            Button {
                
            } label: {
                HStack {
                    PieceAsset.Icon.link.swiftUIImage
                    
                    Text("링크 복사")
                }
            }
            .padding(.horizontal, 26)
            
        }
        .padding(.vertical, 30)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("공유")
                    .font(.pretendard(size: 24, weight: .w500))
            }
        }
        
    }
}

#Preview {
    ShareView(type: .insta)
}
