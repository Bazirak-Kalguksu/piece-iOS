import SwiftUI
import FlowKit

struct SecondSignupView: View {
    @EnvironmentObject var signupVM: SignupViewModel
    @Flow var flow
    var body: some View {
        VStack {
            Spacer(
                minLength: 0
            )
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
            
            Spacer(
                minLength: 0
            )
            .frame(maxHeight: 70)
            
            VStack(spacing: 24) {
                PieceTextField(
                    prompt: "이메일을 입력해주세요",
                    text: $signupVM.email,
                    icon: PieceAsset.Icon.person.swiftUIImage
                )
                
                PieceTextField(
                    prompt: "비밀번호를 입력해주세요",
                    text: $signupVM.password,
                    icon: PieceAsset.Icon.lock.swiftUIImage,
                    isSecure: true
                )
                
                PieceTextField(
                    prompt: "비밀번호를 한번 더 입력해주세요",
                    text: $signupVM.passwordConfirm,
                    icon: PieceAsset.Icon.lock.swiftUIImage,
                    isSecure: true
                )
                
                
            }
            
            Spacer()
            
            PieceButton(title: "회원가입") {
                signupVM.signup {
                    flow.popToRoot(animated: true)
                }
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
    SecondSignupView()
        .environmentObject(SignupViewModel())
}
