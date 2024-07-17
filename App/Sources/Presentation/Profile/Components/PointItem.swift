//
//  PointItem.swift
//  piece
//
//  Created by minho shin on 7/17/24.
//  Copyright © 2024 dev.minhoshin. All rights reserved.
//

import SwiftUI

struct PointItem: View {
    var body: some View {
        Button {
            
        } label: {
            
            HStack {
                Text("포인트")
                    .foregroundStyle(Color.black)
                
                Spacer()
                
                Text("101,200P")
                    .foregroundStyle(Color.Blue.blue700)
                
                Spacer()
                    .frame(maxWidth: 10)
                
                PieceAsset.Icon.front.swiftUIImage
                    .foregroundStyle(Color.Gray.gray500)
                
            }
            .font(.pretendard(size: 20))
            .padding(.horizontal, 12)
            .padding(.vertical, 14)
            .background(
                Color.Gray.gray100
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            )
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    PointItem()
}
