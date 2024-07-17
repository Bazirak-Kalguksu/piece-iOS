import SwiftUI

struct PieceBirthField: View {
    @Binding var date: Date?
    
    @State var sheetCondtion: Bool = false
    
    let dateFormatter = DateFormatter()
    
    init(date: Binding<Date?>) {
        self._date = date
        dateFormatter.dateFormat = "yyyy.MM.dd"
    }
    
    var body: some View {
        Button {
            if date == nil {
                date = Date(timeIntervalSinceReferenceDate: 0)
            }
            
            hideKeyboard()
            
            sheetCondtion.toggle()
        } label: {
            HStack {
                
                PieceAsset.Icon.calendar.swiftUIImage
                
                Spacer()
                    .frame(maxWidth: 24)
                
                
                Group {
                    if let date = date {
                        Text(dateFormatter.string(from: date))
                            .foregroundStyle(Color.black)
                        
                    }
                    else {
                        Text("생년월일을 입력해주세요")
                            .foregroundStyle(Color.Gray.gray500)
                        
                    }
                }
                .font(.pretendard(size: 16))
                
                Spacer()
                
            }
            .padding(18)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(Color.clear)
                    .foregroundStyle(Color.clear)
                    .background(
                        Color.Gray.gray100
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    )
            )
            .padding(.horizontal, 24)
        }
        .sheet(isPresented: $sheetCondtion) {
            
            VStack(alignment: .center) {
                
                if let date = date {
                    DatePicker("dateKey", selection: Binding<Date>(get: { date }, set: { self.date = $0 }), displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(.wheel)
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .presentationDragIndicator(.visible)
            .presentationDetents([
                .height(300)
            ])
            
            
        }
        
        
        
        
    }
}

#Preview {
    PieceBirthField(date: .constant(nil))
}
