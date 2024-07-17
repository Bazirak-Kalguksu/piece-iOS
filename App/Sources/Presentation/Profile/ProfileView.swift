import SwiftUI
import FlowKit

struct ProfileView: View {
    @EnvironmentObject var mainVM: MainNavigationViewModel
    @EnvironmentObject var profileVM: ProfileViewModel
    
    @Flow var flow
    
    var body: some View {
        VStack(spacing: 26) {
            Spacer()
                .frame(maxHeight: 20)
            
            ImageButton()
            
            VStack(spacing: 12) {
                PointItem(title: .point, value: profileVM.model.point) {
                    flow.push(PointView()
                        .environmentObject(profileVM),
                              animated: false
                    )
                }
                
                PointItem(title: .valance, value: profileVM.model.balance) {
                    flow.push(BalanceView()
                        .environmentObject(profileVM),
                              animated: false
                    )
                }
            }
            
            ScrollView {
                VStack(spacing: 0) {
                    
                    ProfileItem(title: .name, value: profileVM.model.name)
                    
                    ProfileItem(title: .birth, value: profileVM.model.birth)
                    
                    ProfileItem(title: .email, value: profileVM.model.email)
                    
                    ProfileItem(title: .signOut) {
                        if KeyChain.delete() {
                            mainVM.objectWillChange.send()
                        }
                    }
                    
                    ProfileItem(title: .userQuit)
                    
                }
            }
            
            
        }
    }
}

#Preview {
    ProfileView()
}
