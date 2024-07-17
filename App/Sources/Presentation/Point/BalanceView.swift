import SwiftUI
import FlowKit

struct BalanceView: View {
    let screenHeight = UIScreen.main.bounds.height
    
    @EnvironmentObject var profileVM: ProfileViewModel
    
    @Flow var flow
    
    var body: some View {
        VStack {
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 40)
                .foregroundStyle(Color.white)
                .frame(maxHeight: screenHeight * 0.5)
                .overlay {
                    VStack {
                        HStack {
                            Text("후원 내역")
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
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    flow.push(ReloadView()
                        .environmentObject(profileVM),
                              animated: false
                    )
                } label: {
                    Text("충전하기")
                        .font(.pretendard(size: 20, weight: .w500))
                        .foregroundStyle(Color.Blue.blue600)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 14)
                        .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 10)))
                }
            }
        }
        .background() {
            VStack {
                LinearGradient(
                    stops: [
                        .init(color: Color.Blue.blue400, location: -0.1),
                        .init(color: Color.Blue.blue650, location: 0.8)
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
                                    Text("잔액")
                                        .font(.pretendard(size: 24, weight: .w700))
                                    
                                    Text("입니다")
                                }
                                
                                Text("\(profileVM.model.balance)원")
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
    FlowPresenter(rootView: BalanceView()
        .environmentObject(ProfileViewModel()))
    .ignoresSafeArea()
}
