import SwiftUI
import FlowKit

struct CampaignView: View {
    
    @Flow var flow
    
    let model: CampaignResponse
    
    var body: some View {
        VStack(spacing: 10) {
            
            Group {
                if let url = URL(string: model.imageUrl) {
                    AsyncImage(url: url) { image in
                        image.image?
                            .resizable()
                            
                    }
                }
                else {
                    Color.Gray.gray100
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(maxHeight: 264)
            .padding(.horizontal, 16)
            
            ScrollView {
                HStack {
                    VStack(alignment: .leading, spacing: 13) {
                        Text(model.title)
                            .font(.pretendard(size: 24, weight: .w700))
                            .foregroundStyle(Color.Blue.blue800)
                        
                        Text(model.description)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 36)
                .padding(.horizontal, 28)
            }
            
            Spacer()
            
            Text("캠페인 공유 시, 100P 지급")
                .font(.pretendard(size: 13, weight: .w500))
                .foregroundStyle(Color.Blue.blue800)
            
            Button { 
                
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 60)
                    .padding(.horizontal, 16)
                    .overlay {
                        Text("후원하기")
                            .foregroundStyle(Color.white)
                            .font(.pretendard(size: 18, weight: .w500))
                    }
            }
            
            
            
        }
        .padding(.vertical, 24)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                PieceBackButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    PieceAsset.Icon.share.swiftUIImage
                        .resizable()
                        .frame(width: 38, height: 38)
                        .foregroundStyle(Color.black)

                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CampaignView(model: .init(title: "출산키트 캠페인", description: "만삭의 몸으로 수백 킬로를 걷다가", idx: 1, imageUrl: ""))
}
