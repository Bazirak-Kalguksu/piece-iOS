import SwiftUI

struct DonationView: View {
    
    @EnvironmentObject var profileVM: ProfileViewModel
    
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
                        
                        Text("포인트로 후원하기")
                        
                        Spacer()
                        
                        Rectangle()
                            .frame(width: 1)
                            .foregroundStyle(Color.Blue.blue450)
                        
                        Spacer()
                        
                        Text("현금으로 후원하기")
                        
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
