import SwiftUI

struct RankView: View {
    let screenHeight = UIScreen.main.bounds.height
    
    @StateObject var rankVM = RankViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("RANK")
                .font(.partial(size: 28))
                .foregroundStyle(Color.Blue.blue600)
            
            HStack(spacing: 23) {
                TopRank(medal: .silver, name: "신민호", point: 93000)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                
                TopRank(medal: .gold, name: "권수현", point: 113000)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                TopRank(medal: .bronze, name: "권수현", point: 90000)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .frame(height: screenHeight * 0.2)
            
            ScrollView {
                ForEach(4..<15) { i in
                    RankCell(id: i, name: "권수현", point: 83000)
                }
            }
        }
    }
}

#Preview {
    
        RankView()
    
}
