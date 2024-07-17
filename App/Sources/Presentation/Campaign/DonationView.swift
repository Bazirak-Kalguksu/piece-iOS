import SwiftUI
import FlowKit

struct DonationView: View {
    
    @EnvironmentObject var profileVM: ProfileViewModel
    
    @Flow var flow
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            
            VStack(alignment: .leading, spacing: 8) {
                
                HStack(spacing: 0) {
                    
                    Text(profileVM.model.name)
                        .font(.pretendard(size: 24, weight: .w500))
                    
                    Text("님의")
                    
                }
                
                Text("포인트입니다")
            }
            .font(.pretendard(size: 24))
            
            
            Spacer()
            
            
            Text("\(profileVM.model.point) P")
                .font(.pretendard(size: 36, weight: .w700))
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.white )
                .frame(height: 50)
                .overlay {
                    HStack {
                        Spacer()
                        
                        Button {
                            profileVM.donation(type: .point, value: 1000) {
                                
                                profileVM.donationSheetCondition = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    if !profileVM.donationSheetCondition {
                                        
                                        flow.alert(
                                            Alert(
                                                title: "완료!",
                                                message: "후원이 완료되었습니다!",
                                                dismissButton: .cancel("확인") {
                                                    profileVM.getProfile()
                                                    
                                                }))
                                        
                                    }
                                }
                            } onError: {
                                profileVM.donationSheetCondition = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    if !profileVM.donationSheetCondition {
                                        
                                        flow.alert(
                                            Alert(
                                                title: "실패",
                                                message: "포인트가 부족합니다.",
                                                dismissButton: .cancel("확인")
                                                {
                                                    
                                                }))
                                        
                                    }
                                }
                            }
                        } label: {
                            Text("포인트로 후원하기")
                        }
                        
                        Spacer()
                        
                        Rectangle()
                            .frame(width: 1)
                            .foregroundStyle(Color.Blue.blue450)
                        
                        Spacer()
                        
                        Button {
                            profileVM.donation(type: .balance, value: 1000) {
                                
                                profileVM.donationSheetCondition = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    if !profileVM.donationSheetCondition {
                                        flow.alert(
                                            Alert(
                                                title: "완료!",
                                                message: "후원이 완료되었습니다!",
                                                dismissButton: .cancel("확인") {
                                                    profileVM.getProfile()
                                                }))
                                    }
                                }
                            } onError: {
                                profileVM.donationSheetCondition = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    if !profileVM.donationSheetCondition {
                                        
                                        flow.alert(
                                            Alert(
                                                title: "실패",
                                                message: "잔액이 부족합니다.",
                                                dismissButton: .cancel("확인") {
                                                    
                                                }))
                                        
                                    }
                                }
                            }
                            
                        } label: {
                            Text("현금으로 후원하기")
                        }
                        
                        
                        Spacer()
                        
                    }
                    .foregroundStyle(Color.Blue.blue750)
                }
                .padding(.horizontal, 15)
            
        }
        .foregroundStyle(Color.white)
        .padding(.horizontal, 24)
        .background(
            LinearGradient(
                stops: [
                    .init(color: Color.Blue.blue750, location: 0.1),
                    .init(color: Color.Blue.blue400, location: 1)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
        )
    }
}

#Preview {
    DonationView()
        .environmentObject(ProfileViewModel())
}
