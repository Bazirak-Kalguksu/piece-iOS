import SwiftUI
import FlowKit

struct CampaignCell: View {
    let model: CampaignResponse
    
    @Flow var flow
    
    var body: some View {
        VStack {
            Group {
                if let url = URL(string: model.imageUrl) {
                    AsyncImage(url: url) { image in
                        image.image?
                            .resizable()
                            .scaledToFill()
                    }
                    
                }
                else {
                    Color.Gray.gray100
                }
            }
            
            .frame(height: 99)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.horizontal, 4)
            
            
            
            HStack {
                VStack(alignment: .leading) {
                    Text(model.title)
                        .font(.pretendard(size: 20, weight: .w500))
                        .foregroundStyle(Color.black)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Text("후원하기")
                        .font(.pretendard(size: 15, weight: .w500))
                        .foregroundStyle(Color.white)
                        .padding(20)
                        .background(Color.Blue.blue700.clipShape(RoundedRectangle(cornerRadius: 10)))
                }
                
                
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 22)
            .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 10)))
            
        }
        .padding(10)
        .background(Color.Gray.gray100.clipShape(RoundedRectangle(cornerRadius: 10)))
        .padding(.horizontal, 10)
        .onTapGesture {
            flow.push(CampaignView(model: model), animated: false)
        }
        
        
        
    }
}
