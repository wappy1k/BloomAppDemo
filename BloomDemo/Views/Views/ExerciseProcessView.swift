//
//  ExerciseProcessView.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 11.12.23.
//

import SwiftUI

struct ExerciseProcessView: View {
    @Environment(\.dismiss) var dismiss
    let exercise: ExerciseModel
    @State var feedbackText: String = ""
    @State var currentExercise: Int = 0
    @State var isFinished: Bool = false
    
    var body: some View {
        ZStack {
            Color.bg
                .ignoresSafeArea()
            VStack {
                if !isFinished {
                    
                    VStack(alignment: .leading) {
                        Text("Take a look about you and say aloud:")
                            .foregroundStyle(Color.main)
                            .padding()
                        titleView
                        descriptionView
                    }
                    
                    
                } else {
                    rateView
                }
                
                Spacer()
                doneButton
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .frame(width: 15, height: 25)
                            .foregroundStyle(Color.main)
                    }
                }
                Text(exercise.title)
            }
        })
    }
    
    var titleView: some View {
        HStack {
            
            ZStack {
                
                Color.white
                    .background {
                        exercise.color
                            .offset(x: -5, y: 5)
                    }
                    .frame(height: 130)
                
                
                VStack {
                    VStack(alignment: .leading) {
                        
                        
                        Text(exercise.exercises[currentExercise].title)
                            .font(.system(size: 23, weight: .bold))
                            .padding(.bottom, 2)
                        
                    }
                    
                    .padding(.vertical)
                    
                    exercise.exercises[currentExercise].image
                        .resizable()
                        .frame(width: 40, height: 30)
                }
                .padding()
                
                
                
            }
            
            .padding()
        }
    }
    
    var descriptionView: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(exercise.exercises[currentExercise].description)
            }
            .multilineTextAlignment(.leading)
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(Color.main)
            .padding(.bottom)
            
            Text("Simply make a mental note of them if you aren't in comfortable enough sitting to say them out.")
                .font(.system(size: 14, weight: .regular))
                .italic()
                .foregroundStyle(Color.main)
        }
        .padding()
    }
    
    var doneButton: some View {
        BButton(title: "Done") {
            if isFinished {
                currentExercise = 0
                dismiss()
            }
            
            if currentExercise < exercise.exercises.count - 1 {
                currentExercise += 1
            } else if currentExercise >= exercise.exercises.count - 1{
                isFinished = true
            } 
            
        }
    }
    
    var rateView: some View {
        VStack {
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(exercise.color)
                    .frame(width: 15, height: 10)
                    .padding(.top, -15)
                    .offset(x: -2, y: 32)
                
                VStack(alignment: .leading) {
                    
                    
                    Text("Take a deep, full breath to conclude this exercise.")
                        .font(.system(size: 17, weight: .regular))
                        .padding(.bottom, 2)
                    
                }
                .padding()
                
            }
            .frame(width: 310)
            .background {
                Color.white
                    .background {
                        exercise.color
                            .offset(x: -5, y: 5)
                    }
                    .padding(.vertical, -2)
            }
            .padding()
            
            VStack {
                VStack(alignment: .leading) {
                    Text("Rate Your Experience")
                        .font(.system(size: 23, weight: .bold))
                    
                    Text("How was this experience in Finding Balance?")
                        .font(.system(size: 16, weight: .regular))
                }
                HStack {
                    ForEach(0..<5, id: \.self) { _ in
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text("Your feedback")
                    .font(.system(size: 15, weight: .bold))
                    .padding()
                VStack(alignment: .trailing) {
                    BTextField(titleKey: "", value: $feedbackText)
                        
                    BButton(title: "Submit", width: 100, height: 50) {
                        
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ExerciseProcessView(exercise: ExerciseModel(title: "5-4-3-2-1", description: "Utilise your senses to anchor awareness and ground yourself in the present with this peaceful, mindful tehcnique.", color: .balance, exercises: [
        Exercise(title: "5 things you see around you", image: Image(systemName: "eye"), description: 
                    """
                 • You can search closer to home or farther away.
                 Why not stare out of the window if you're inside?
                 • Seek out minute things, like the way the light reflects or a pattern you've never seen before.
                 """),
        Exercise(title: "4 things you touch around you", image: Image(systemName: "square"), description:
                    """
                 • You may concentrate on how the earth feels
                 under your feet.
                 • Consider the weight and feel of an object in your hands when you take it up.
                 """),
        Exercise(title: "3 things you hear around you", image: Image(systemName: "dot"), description:
                    """
                 • If there's a window nearby. maybe keep an ear out for birds or vehicles.
                 • Pay close attention to any sounds that your mind has blocked out, such the wind flowing through the trees or the ticking of a clock.
                 """),
        Exercise(title: "2 things you smell around you", image: Image(systemName: "eye"), description:
                    """
                 • Make an effort to detect odours in the air around you, such as the aroma of the place you're in or the surroundings around you.
                 • Maybe there's a perfume in the air, like from a flower or an unlit candle.
                 """),
        Exercise(title: "1 thing you can taste around you", image: Image(systemName: "person"), description:
                    """
                 • What flavour does the interior of your tongue have? Gum chewing? Juice from oranges? The lunchtime panini?
                 • The final stage is to concentrate on your mouth and taste what you can.
                 """),
    ]))
}
