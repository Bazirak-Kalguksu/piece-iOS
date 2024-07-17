import SwiftUI
import FlowKit

struct HomeView: View {
    
    @Flow var flow
    
    var body: some View {
        VStack {
            PieceSearchField(text: .constant(""))
            
            ScrollView {
                
            }
            
            
        }
   
        
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
