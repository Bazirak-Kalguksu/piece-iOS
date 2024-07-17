import SwiftUI

struct PieceButton: View {
    let title: String
    let action: () -> ()
    
    let screenHeight = UIScreen.main.bounds.height
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.Gray.gray300)
                .frame(height: screenHeight * 0.07)
                .padding(.horizontal, 24)
                .overlay {
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.pretendard(size: 20, weight: .w600))
                }
        }
            
    }
}

#Preview {
    PieceButton(title: "로그인") {
        print("S")
    }
}
