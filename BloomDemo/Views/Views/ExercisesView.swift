//
//  ExercisesView.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 10.12.23.
//

import SwiftUI

struct ExercisesView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var cbtMethodVM = CBTMethodViewModel()
    @State var selectedMethod: CBTMethodModel?
    
    let exercises: [ExerciseModel]
    
    var body: some View {
        ZStack {
            Color.bg
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                title
                methodsView
                exercisesView
            }
            .onAppear(perform: getData)
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
        Text("CBT Methods")
            .font(.system(size: 30, weight: .bold))
            .foregroundStyle(Color.main)
            .padding(.horizontal)
            .offset(y: 20)
    }
    
    var methodsView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(cbtMethodVM.cbtMethods, id: \.title) { method in
                    methodButton(method: method) {
                        cbtMethodVM.selectedMethod = method
                    }
                }
                .padding(10)
                
            }
        }
        .padding(.horizontal)
    }
    
    var exercisesView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if let selectedMethod = cbtMethodVM.selectedMethod {
                VStack {
                    ForEach(selectedMethod.exercises, id: \.title) { exercise in
                        ExerciseCellView(exercise: exercise)
                    }
                }
            } else {
                VStack {
                    ForEach(exercises, id: \.title) { exercise in
                        ExerciseCellView(exercise: exercise)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func methodButton(method: CBTMethodModel, completion: @escaping (() -> Void)) -> some View {
        Button {
            completion()
        } label: {
            Text(method.title)
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(Color.main)
                .background {
                    RoundedRectangle(cornerRadius: Constants.cornerRaius)
                        .fill(cbtMethodVM.selectedMethod == method ? method.color : Color.tab)
                        .padding(.vertical, -3)
                        .padding(.horizontal, -10)
                }
        }
            
    }
    
    func getData() {
        if let selectedMethod = selectedMethod {
            cbtMethodVM.selectedMethod = selectedMethod
        }
    }
    
}

#Preview {
    ExercisesView(exercises: [
        ExerciseModel(title: "5-4-3-2-1 Grounding", description: "Use to help in regain a sense of control and presence in the moment.", color: Color.balance, exercises: [
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
        ]),
        ExerciseModel(title: "Deep Breathing", description: "Deep breathing is a powerful tool used for reducing stress and anxiety.", color: Color.balance, exercises: []),
    ])
}
