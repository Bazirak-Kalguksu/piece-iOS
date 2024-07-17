import SwiftUI
import FlowKit

struct ReloadView: View {
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
                        VStack {
                            HStack(spacing: 15) {
                                AddButton(value: 1000)
                                
                                AddButton(value: 5000)
                                
                                
                                AddButton(value: 10000)                        }
                            
                            HStack(spacing: 18) {
                                AddButton(value: 50000)
                                
                                
                                AddButton(value: 100000)
                            }
                        }
                        .environmentObject(profileVM)
                        
                        Spacer()
                        
                        Button {
                            profileVM.chargeMoney {
                                flow.alert(
                                    Alert(
                                        title: "알림",
                                        message: "충전이 완료되었습니다",
                                        dismissButton: .cancel {
                                            profileVM.getProfile()
                                            flow.popToRoot(animated: false)
                                        }
                                    ))
                            }
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(maxHeight: 60)
                                .overlay {
                                    Text("충전하기")
                                        .font(.pretendard(size: 18, weight: .w500))
                                        .foregroundStyle(.white)
                                }
                        }
                    }
                    .padding(.vertical, 44)
                    .padding(.horizontal, 16)
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
                        .init(color: Color.Blue.blue400, location: -0.1),
                        .init(color: Color.Blue.blue650, location: 0.8)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                .frame(maxHeight: screenHeight * 0.6)
                .overlay {
                    VStack {
                        Text("현재 잔액")
                            .font(.pretendard(size: 20, weight: .w500))
                        
                        Text("\(profileVM.model.balance)원")
                            .font(.pretendard(size: 36, weight: .w700))
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(maxHeight: 55)
                            .overlay {
                                Text(profileVM.reloadValue > 0 ? "\(profileVM.reloadValue)" : "충전 금액을 입력해주세요")
                                    .font(.pretendard(size: 20))
                                    .foregroundStyle(Color.Blue.blue650)
                            }
                            .padding(.horizontal, 40)
                        
                    }
                    .foregroundStyle(Color.white)
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    FlowPresenter(rootView: ReloadView()
        .environmentObject(ProfileViewModel()))
    .ignoresSafeArea()
    
}
