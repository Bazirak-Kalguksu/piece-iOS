import SwiftUI
import FlowKit

struct PointView: View {
    let screenHeight = UIScreen.main.bounds.height
    
    @EnvironmentObject var profileVM: ProfileViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 40)
                .foregroundStyle(Color.white)
                .frame(maxHeight: screenHeight * 0.5)
                .overlay {
                    VStack {
                        HStack {
                            Text("포인트 후원 내역")
                                .font(.pretendard(size: 24, weight: .w600))
                            
                            Spacer()
                        }
                        .padding(36)
                        
                        Spacer()
                    }
                }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                PieceBackButton(color: Color.white)
                    
                    
            }
        }
        .background() {
            VStack {
                LinearGradient(
                    stops: [
                        .init(color: Color.Blue.blue650, location: 0.25),
                        .init(color: Color.Blue.blue400, location: 1)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                .frame(maxHeight: screenHeight * 0.6)
                .overlay {
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                
                                Text("\(profileVM.model.name)님의")
                                
                                HStack(spacing: 0) {
                                    Text("포인트")
                                        
                                        .font(.pretendard(size: 24, weight: .w700))
                                    Text("입니다")
                                }
                                
                                Text("\(profileVM.model.point) P")
                                    .font(.pretendard(size: 36, weight: .w700))
                                
                            }
                            .foregroundStyle(Color.white)
                            .font(.pretendard(size: 24))
                            .padding(.horizontal, 34)
                            
                            Spacer()
                        }
                    }
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()

        
    }
}

#Preview {
    FlowPresenter(rootView: PointView()).ignoresSafeArea()

}
