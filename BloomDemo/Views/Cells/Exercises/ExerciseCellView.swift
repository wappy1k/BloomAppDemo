//
//  ExerciseCellView.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 10.12.23.
//

import SwiftUI

struct ExerciseCellView: View {
    let exercise: ExerciseModel
    
    var body: some View {
        NavigationLink {
            ExerciseDetailsView(exercise: exercise)
        } label: {
            contentView
                .padding(.horizontal)
                .padding(.bottom, 10)
                .foregroundStyle(Color.main)
        }
            
    }
    
    var contentView: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(exercise.title)
                    .font(.system(size: 23, weight: .bold))
                    .padding(.bottom, 2)
                
                Text(exercise.description)
                    .font(.system(size: 18, weight: .regular))
                
                RoundedRectangle(cornerRadius: 2)
                    .fill(exercise.color)
                    .frame(width: 10, height: 15)
                    .padding(.top, -15)
                    .offset(y: 20)
            }
            .padding()
            
            HStack {
                Spacer()
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .padding()
            .offset(y: -30)
        }
        .background {
            Color.white
                .background {
                    exercise.color
                        .offset(x: -5, y: 5)
                }
                .padding(.vertical, -2)
        }
    }
}

#Preview {
    ExerciseCellView(exercise: ExerciseModel(title: "5-4-3-2-1 Grounding", description: "Use to help in regain a sense of control and presence in the moment", color: Color.balance, exercises: [
        Exercise(title: "5 things you see around you", image: Image(systemName: "eye"), description:
                    """
                 • You can search closer to home or farther away.
                 Why not stare out of the window if you're inside?
                 • Seek out minute things, like the way the light reflects or a pattern you've never seen before.
                 """),
        Exercise(title: "5 things you see around you", image: Image(systemName: "eye"), description:
                    """
                 • You can search closer to home or farther away.
                 Why not stare out of the window if you're inside?
                 • Seek out minute things, like the way the light reflects or a pattern you've never seen before.
                 """),
        Exercise(title: "5 things you see around you", image: Image(systemName: "eye"), description:
                    """
                 • You can search closer to home or farther away.
                 Why not stare out of the window if you're inside?
                 • Seek out minute things, like the way the light reflects or a pattern you've never seen before.
                 """),
        Exercise(title: "5 things you see around you", image: Image(systemName: "eye"), description:
                    """
                 • You can search closer to home or farther away.
                 Why not stare out of the window if you're inside?
                 • Seek out minute things, like the way the light reflects or a pattern you've never seen before.
                 """),
        Exercise(title: "5 things you see around you", image: Image(systemName: "eye"), description:
                    """
                 • You can search closer to home or farther away.
                 Why not stare out of the window if you're inside?
                 • Seek out minute things, like the way the light reflects or a pattern you've never seen before.
                 """),
    ]))
}
