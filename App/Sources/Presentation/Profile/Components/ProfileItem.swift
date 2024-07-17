import SwiftUI

enum ProfileTitle: String {
    case name = "이름"
    case birth = "생년월일"
    case email = "이메일"
    case signOut = "로그아웃"
    case userQuit = "회원 탈퇴"
    
    var color: Color {
        switch self {
        case .signOut:
            return Color.Red.red500
        case .userQuit:
            return Color.Red.red500
        default:
            return Color.black
        }
    }
}



struct ProfileItem: View {
    let title: ProfileTitle
    let value: String?
    let action: (() -> ())?
    
    init(title: ProfileTitle, value: String? = nil, action: (() -> ())? = nil) {
        self.title = title
        self.value = value
        self.action = action
    }
    
    var body: some View {
        Button {
            if let action = action {
                action()
            }
        } label: {
            HStack {
                
                Text(title.rawValue)
                    .foregroundStyle(title.color)
                
                Spacer()
                
                if let value = value {
                    Text(value)
                        .foregroundStyle(Color.Gray.gray500)
                }
                
            }
        }
        .padding(.vertical, 19)
        .padding(.horizontal, 34)
    }
}

#Preview {
    ProfileItem(title: .signOut, value: "")
}
