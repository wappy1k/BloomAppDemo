//
//  SettingCellView.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 10.12.23.
//

import SwiftUI

struct SettingCellView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        contentView
    }
    
    var contentView: some View {
        Button {
            
        } label: {
            VStack {
                HStack {
                    titleView
                    Spacer()
                    arrowRight
                }
                .padding(.horizontal)
                Divider()
            }
        }
    }
    
    var titleView: some View {
        Text(title)
            .font(.system(size: 17, weight: .regular))
            .foregroundStyle(Color.main)
    }
    
    var arrowRight: some View {
        Image(systemName: "chevron.right")
            .foregroundStyle(Color.main)
    }
}

#Preview {
    SettingCellView(title: "Smth") {
        
    }
}
