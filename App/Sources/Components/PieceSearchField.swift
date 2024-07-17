import SwiftUI

struct PieceSearchField: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var body: some View {
        HStack {
            Button { 
                homeVM.searchCampaigns()
            } label: {
                PieceAsset.Icon.search.swiftUIImage
                    .foregroundStyle(Color.Blue.blue700)
            }
            
            Spacer(minLength: 24)
            
            TextField(
                "SearchKey",
                text: $homeVM.search,
                prompt: Text("검색어를 입력해주세요")
                    .font(.pretendard(size: 15, weight: .w300))
                    .foregroundColor(Color.Gray.gray500)
            )
            .font(.pretendard(size: 15, weight: .w300))
            .onSubmit {
                homeVM.searchCampaigns()
            }
            
            Spacer()
            
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
            Color.Gray.gray100
                .clipShape(RoundedRectangle(cornerRadius: 5)))
        .padding(.horizontal, 8)
    }
}

#Preview {
    PieceSearchField()
        .environmentObject(HomeViewModel())
}
