//
//  ProfileView.swift
//  piece
//
//  Created by minho shin on 7/17/24.
//  Copyright © 2024 dev.minhoshin. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var mainVM: MainNavigationViewModel
    
    var body: some View {
        VStack(spacing: 26) {
            Spacer()
                .frame(maxHeight: 20)
            
            ImageButton()
            
            PointItem()
            
            ScrollView {
                VStack(spacing: 0) {
                    ProfileItem(title: .name, value: "권수현")
                    
                    ProfileItem(title: .birth, value: "2008.09.15")
                    
                    ProfileItem(title: .email, value: "tngus915@gmail.com")
                    
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
