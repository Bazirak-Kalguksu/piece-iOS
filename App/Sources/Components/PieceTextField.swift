import SwiftUI

struct PieceTextField: View {
    let prompt: String
    @Binding var text: String
    let contentType: UITextContentType?
    let icon: Image
    let isSecure: Bool
    
    @FocusState private var onFocus: Bool
    
    init(prompt: String, text: Binding<String>, contentType: UITextContentType? = .none, icon: Image, isSecure: Bool = false) {
        self.prompt = prompt
        self._text = text
        self.contentType = contentType
        self.icon = icon
        self.isSecure = isSecure
    }
    
    var body: some View {
        HStack {
            icon
            
            Spacer(minLength: 26)
            
            Group {
                
                if(!isSecure) {
                    TextField(
                        "\(prompt)key",
                        text: $text,
                        prompt: Text(prompt)
                            .foregroundColor(.Gray.gray500)
                            .font(.pretendard(size: 16))
                        
                    )
                }
                
                else {
                    SecureField(
                        "\(prompt)key",
                        text: $text,
                        prompt: Text(prompt)
                            .foregroundColor(.Gray.gray500)
                            .font(.pretendard(size: 16))
                    )
                    
                }
                
            }
            .focused($onFocus)
            .textContentType(contentType)
            .foregroundStyle(Color.black)
            .font(.pretendard(size: 16))
            
            Spacer()
            
            
        }
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(onFocus ? Color.Blue.blue500 : Color.clear)
                .foregroundStyle(Color.clear)
                .background(
                    Color.Gray.gray100
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                )
        )
        .padding(.horizontal, 24)
    }
}

#Preview {
    
    PieceTextField(prompt: "이메일을 입력해주세요", text: .constant(""), icon: PieceAsset.Icon.person.swiftUIImage)
}
