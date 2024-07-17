import SwiftUI

struct RankView: View {
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(spacing: 30) {
            Text("RANK")
                .font(.partial(size: 28))
                .foregroundStyle(Color.Blue.blue600)
            
            HStack(spacing: 23) {
                TopRank(medal: .silver, name: "w", point: 100)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                
                TopRank(medal: .gold, name: "w", point: 100)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                TopRank(medal: .bronze, name: "권수현", point: 100)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .frame(height: screenHeight * 0.2)
            
            ScrollView {
                ForEach(4..<15) { i in
                    RankCell(id: i, name: "권수현", point: 89000)
                }
            }
        }
    }
}

#Preview {
    
        RankView()
    
}
