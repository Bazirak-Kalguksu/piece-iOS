import SwiftUI
import FlowKit

struct PieceBackButton: View {
    @Flow var flow
    
    let color: Color
    let action: (() -> ())?
    
    init(color: Color = Color.black, action: (() -> Void)? = nil) {
        self.color = color
        self.action = action
    }
    
    var body: some View {
        Button {
            (action ?? { flow.pop(animated: false) })()
        } label: {
            PieceAsset.Icon.back.swiftUIImage
                .resizable()
                .frame(width: 18, height: 31)
                .foregroundStyle(color)
                
        }
    }
}

#Preview {
    PieceBackButton()
}
