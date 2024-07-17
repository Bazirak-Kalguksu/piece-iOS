//
//  ImageButton.swift
//  piece
//
//  Created by minho shin on 7/17/24.
//  Copyright © 2024 dev.minhoshin. All rights reserved.
//

import SwiftUI

struct ImageButton: View {
    var body: some View {
        Button {
            
        } label: {
            
            PieceAsset.Icon.profile.swiftUIImage
                .resizable()
                .frame(maxWidth: 110, maxHeight: 110)
                .foregroundStyle(Color.Blue.blue500)
//                .overlay {
//                    PieceAsset.Icon.plus.swiftUIImage
//                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
//                }
            
        }
    }
}

#Preview {
    ImageButton()
}
