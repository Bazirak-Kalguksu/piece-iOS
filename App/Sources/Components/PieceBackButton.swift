import SwiftUI
import FlowKit

struct PieceBackButton: View {
    @Flow var flow
    let action: (() -> ())?
    
    init(action: (() -> Void)? = nil) {
        self.action = action
    }
    
    var body: some View {
        Button {
            (action ?? { flow.pop(animated: false) })()
        } label: {
            PieceAsset.Icon.back.swiftUIImage
                .resizable()
                .frame(width: 18, height: 31)
                .foregroundStyle(Color.black)
                
        }
    }
}

#Preview {
    PieceBackButton()
}
