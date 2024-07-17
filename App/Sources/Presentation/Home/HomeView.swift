import SwiftUI
import FlowKit

struct HomeView: View {
    
    @Flow var flow
    
    @EnvironmentObject var mainVM: MainNavigationViewModel
    @StateObject var homeVM = HomeViewModel()
    
    
    var body: some View {
        VStack(spacing: 12) {
            Rectangle()
                .frame(maxHeight: 114)
                .foregroundStyle(Color.Blue.blue500)
                .overlay {
                    VStack(spacing: 0) {
                        Spacer()
                        
                        PieceAsset.Vector.homeLogo.swiftUIImage
                            .resizable()
                            .frame(maxWidth: 166, maxHeight: 42)
                    }
                    .padding(.vertical, 12)
                }
            
            
            PieceSearchField()
                .environmentObject(homeVM)
            
            ScrollView {
                Spacer(minLength: 10)
                
                VStack(spacing: 22) {
                    ForEach(homeVM.campaigns, id: \.idx) { item in
                        CampaignCell(model: item)
                            .task {
                                if homeVM.hasReachedEnd(of: item) {
                                    await homeVM.nextCampaigns()
                                }
                            }
                    }
                    
                }
                
                
                Spacer(minLength: 80)
                
            }
            .refreshable {
                homeVM.resetCampaigns()
                homeVM.getCampaigns()
            }
                        
            
        }
        .ignoresSafeArea()

        
        
        
    }
}

#Preview {
    FlowPresenter(rootView: HomeView())
}
