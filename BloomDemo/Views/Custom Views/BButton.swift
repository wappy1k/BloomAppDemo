//
//  BButton.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 09.12.23.
//

import SwiftUI

struct BButton: View {
    var title: String = ""
    var width: CGFloat = 145
    var height: CGFloat = 65
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.button)
                .frame(width: width, height: height)
                .shadow(color: Color.shadow, radius: 0, x: -2, y: 2)
                .overlay {
                    Text(title)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(Color.main)
                }

        }
    }
}

#Preview {
    BButton {
        
    }
}
