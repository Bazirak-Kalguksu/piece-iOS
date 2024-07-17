import SwiftUI
import Moya

struct ContentView: View {
    
    @State var text: String = ""
    
    var body: some View {
        PieceTextField(prompt: "이메일을 입력해주세요", text: $text, icon: PieceAsset.Icon.person.swiftUIImage, isSecure: true)
        
    }
}

#Preview {
    ContentView()
}
