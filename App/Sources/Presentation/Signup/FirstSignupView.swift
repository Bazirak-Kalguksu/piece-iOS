import SwiftUI
import FlowKit

struct FirstSignupView: View {
    @Flow var flow
    @StateObject var signupVM = SignupViewModel()
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
                .frame(maxHeight: 70)
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("회원가입을 위한 정보를")
                    Text("입력해주세요")
                    
                }
                .font(.pretendard(size: 24, weight: .w600))
                
                Spacer()
            }
            .padding(.horizontal, 24)
            
            Spacer()
                .frame(maxHeight: 70)
            
            VStack(spacing: 24) {
                PieceTextField(
                    prompt: "이름을 입력해주세요",
                    text: $signupVM.name,
                    icon: PieceAsset.Icon.person.swiftUIImage)
                
                PieceBirthField(
                    date: $signupVM.birth
                )
            }
            
            Spacer()
            
            PieceButton(title: "다음") {
                flow.push(
                    SecondSignupView()
                        .navigationBarBackButtonHidden()
                        .environmentObject(signupVM),
                    animated: false
                )
            }
            
            Spacer()
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                PieceBackButton()
                    
            }
        }
    }
}

#Preview {
   FlowPresenter(rootView: SigninView())
}
