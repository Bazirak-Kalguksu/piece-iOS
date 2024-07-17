import SwiftUI
import FlowKit

struct SigninView: View {
    @StateObject var signinVM = SigninViewModel()
    
    @Flow var flow
    
    @EnvironmentObject var mainVM: MainNavigationViewModel
    

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            PieceAsset.Vector.logo.swiftUIImage
                .resizable()
                .frame(maxWidth: 213, maxHeight: 56)
            
            Spacer()
            
            VStack(spacing: 24) {
                PieceTextField(
                    prompt: "이메일을 입력해주세요",
                    text: $signinVM.email,
                    contentType: .emailAddress,
                    icon: PieceAsset.Icon.person.swiftUIImage
                )
                
                
                PieceTextField(
                    prompt: "비밀번호를 입력해주세요",
                    text: $signinVM.password,
                    contentType: .newPassword,
                    icon: PieceAsset.Icon.lock.swiftUIImage,
                    isSecure: true)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                
                PieceButton(title: "로그인") {
                    signinVM.signin {
                        mainVM.selection = .home
                        mainVM.objectWillChange.send()
                        
                    } onError: {
                        flow.alert(Alert(title: "알림", message: "계정이 존재하지 않습니다.", dismissButton: .cancel("확인")))
                    }
                }
                
                HStack(spacing: 6) {
                    Text("계정이 없으신가요?")
                        .foregroundStyle(Color.Gray.gray500)
                    
                    Button {
                        flow.push(
                            FirstSignupView()
                                .navigationBarBackButtonHidden(),
                            animated: false
                            
                        )
                    } label: {
                        Text("회원가입")
                            .foregroundStyle(Color.black)
                    }
                }
                .font(.pretendard(size: 14))
                .padding(.horizontal, 26)
            }
            
            Spacer()
        }
    }
}

#Preview {
    FlowPresenter(
        rootView: SigninView()
            .environmentObject(MainNavigationViewModel())
    )
    
}
