//
//  ExerciseDetailsView.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 11.12.23.
//

import SwiftUI

struct ExerciseDetailsView: View {
    @Environment(\.dismiss) var dismiss
    let exercise: ExerciseModel
    
    @State var isShowQA1: Bool = false
    @State var isShowQA2: Bool = false
    @State var isShowQA3: Bool = false
    
    var body: some View {
        ZStack {
            Color.bg
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .leading) {
                    title
                    description
                    QAView
                    Spacer()
                }
                beginButton
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(width: 15, height: 25)
                        .foregroundStyle(Color.main)
                }
            }
        })
    }
    
    var title: some View {
        Text(exercise.title)
            .font(.system(size: 30, weight: .bold))
            .foregroundStyle(Color.main)
            .padding()
    }
    
    var description: some View {
        Text(exercise.description)
            .font(.system(size: 17, weight: .regular))
            .foregroundStyle(Color.main)
            .padding(.horizontal)
    }
    
    var QAView: some View {
        VStack {
            makeQAView(title: "How is this going to help?", description: "How is this going to helpHow is this going to helpHow is this going to help", isShow: isShowQA1)
                .onTapGesture {
                    withAnimation {
                        isShowQA1.toggle()
                    }
                }
            makeQAView(title: "When should I not apply this method?", description: "When should I not apply this method?When should I not apply this method?When should I not apply this method?", isShow: isShowQA2)
                .onTapGesture {
                    withAnimation {
                        isShowQA2.toggle()
                    }
                }
            makeQAView(title: "Advice", description: "AdviceAdviceAdviceAdviceAdviceAdviceAdviceAdviceAdviceAdviceAdviceAdviceAdviceAdviceAdviceAdviceAdviceAdviceAdvice", isShow: isShowQA3)
                .onTapGesture {
                    withAnimation {
                        isShowQA3.toggle()
                    }
                }
        }
        .padding()
    }
    
    var beginButton: some View {
        NavigationLink {
            ExerciseProcessView(exercise: exercise)
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.button)
                .frame(width: 250, height: 60)
                .shadow(color: Color.shadow, radius: 0, x: -2, y: 2)
                .overlay {
                    Text("Begin exercise")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(Color.main)
                }
        }
    }
    
    @ViewBuilder
    func makeQAView(title: String, description: String, isShow: Bool) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.system(size: 17, weight: .bold))
                Spacer()
                
                Image(systemName: isShow ? "chevron.up" : "chevron.down")
                    .resizable()
                    .frame(width: 14, height: 10)
                    .foregroundStyle(Color.main)
                
            }
            if isShow {
                Text(description)
                    .font(.system(size: 17, weight: .regular))
            }
        }
        .background {
            Rectangle()
                .fill(Color.white)
                .padding(-15)
        }
        .padding()
    }
}

#Preview {
    ExerciseDetailsView(exercise: ExerciseModel(title: "5-4-3-2-1", description: "Utilise your senses to anchor awareness and ground yourself in the present with this peaceful, mindful tehcnique.", color: .balance, exercises: [
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
