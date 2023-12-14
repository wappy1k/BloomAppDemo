//
//  CBTMethodView.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 09.12.23.
//

import SwiftUI

struct CBTMethodCellView: View {
    var cbtMethod: CBTMethodModel
    var size: CGSize = CGSize(width: 140, height: 160)
    var body: some View {
        NavigationLink(destination: ExercisesView(selectedMethod: cbtMethod, exercises: cbtMethod.exercises)) {
            VStack {
                title
                VStack {
                    image
                    exercisesView
                        .offset(y: -13)
                }
            }
        }
    }
    
    var title: some View {
        Text(cbtMethod.title)
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(Color.main)
    }
    
    var image: some View {
        Rectangle()
            .stroke(cbtMethod.color, lineWidth: 10)
            .frame(width: size.width, height: size.height)
            .overlay {
                cbtMethod.image
                    .resizable()
                    .frame(width: size.width, height: size.height)
            }
    }
    
    var exercisesView: some View {
        Text("\(cbtMethod.exercises.count) Exercises")
            .font(.system(size: 13, weight: .bold))
            .foregroundStyle(Color.main)
            .background {
                RoundedRectangle(cornerRadius: Constants.cornerRaius)
                    .fill(cbtMethod.color)
                    .padding(.vertical, -3)
                    .padding(.horizontal, -15)
            }
    }
}

#Preview {
    CBTMethodCellView(cbtMethod: CBTMethodModel(title: "Find Balance", image: Image(uiImage: UIImage.balance), color: Color.balance, exercises: []))
}
