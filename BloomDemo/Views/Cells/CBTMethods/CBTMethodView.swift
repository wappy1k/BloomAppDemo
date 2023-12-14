//
//  CBTMethodView.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 09.12.23.
//

import SwiftUI

struct CBTMethodView: View {
    var cbtMethods: [CBTMethodModel]
    var defaultMethod = CBTMethodModel(title: "Find Balance", image: Image(uiImage: UIImage.balance), color: Color.balance, exercises: [])
    var body: some View {
        VStack {
            topMethodsView
            bottomMethodsView
        }
        .padding()
    }
    
    var topMethodsView: some View {
        HStack {
            ForEach(0..<cbtMethods.count, id: \.self) { index in
                if index < 2 {
                    CBTMethodCellView(cbtMethod: cbtMethods[index])
                }
            }
            .padding(.horizontal)
        }
    }
    var bottomMethodsView: some View {
        HStack {
            ForEach(0..<cbtMethods.count, id: \.self) { index in
                if index > 1 && index < 4 {
                    CBTMethodCellView(cbtMethod: cbtMethods[index])
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CBTMethodView(cbtMethods: [
        CBTMethodModel(title: "Find Balance", image: Image(uiImage: UIImage.balance), color: Color.balance, exercises: []),
        CBTMethodModel(title: "Calm Yourself", image: Image(uiImage: UIImage.calm), color: Color.calm, exercises: []),
        CBTMethodModel(title: "Ease Mind", image: Image(uiImage: UIImage.mind), color: Color.mind, exercises: []),
        CBTMethodModel(title: "Refresh Energy", image: Image(uiImage: UIImage.energy), color: Color.energy, exercises: []),
    ])
}
