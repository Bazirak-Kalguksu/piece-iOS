import SwiftUI

struct AddButton: View {
    
    @EnvironmentObject var profileVM: ProfileViewModel
    
    let value: Int
    
    
    init(value: Int) {
        self.value = value
        
    }
    
    var body: some View {
        Button {
            profileVM.reloadValue += value
        } label: {
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color.Blue.blue500, lineWidth: 1)
                .foregroundStyle(Color.white)
                .frame(maxHeight: 50)
                .overlay {
                    Text("+\(value)")
                        .font(.pretendard(size: 20, weight: .w500))
                }
                
        }
    }
}

#Preview {
    AddButton(value: 1000)
}
