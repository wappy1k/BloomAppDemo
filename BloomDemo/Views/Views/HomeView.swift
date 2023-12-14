//
//  HomeView.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 09.12.23.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @ObservedObject var authVM = AuthViewModel()
    
    let methods: [CBTMethodModel] = [
        CBTMethodModel(title: "Find Balance", image: Image(uiImage: UIImage.balance), color: Color.balance, exercises: [
            ExerciseModel(title: "5-4-3-2-1 Grounding", description: "Use to help in regain a sense of control and presence in the moment.", color: Color.balance, exercises: [
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
            ]),
            ExerciseModel(title: "Deep Breathing", description: "Deep breathing is a powerful tool used for reducing stress and anxiety.", color: Color.balance, exercises: []),
        ]),
        CBTMethodModel(title: "Calm Yourself", image: Image(uiImage: UIImage.calm), color: Color.calm, exercises: [
            ExerciseModel(title: "Progressive Muscle Relaxation", description: "Use to reduce physical tension for outbursts in stress and anxiety.", color: Color.calm, exercises: []),
            ExerciseModel(title: "Mindful Breathing", description: "Simple mindfulness meditation to focus on breathing to help calm the mind.", color: Color.calm, exercises: []),
        ]),
        CBTMethodModel(title: "Ease Mind", image: Image(uiImage: UIImage.mind), color: Color.mind, exercises: [
            ExerciseModel(title: "Thought Reframing", description: "Use to challenge negative thoughts and replacing them with balanced ones.", color: Color.mind, exercises: [])
        ]),
        CBTMethodModel(title: "Refresh Energy", image: Image(uiImage: UIImage.energy), color: Color.energy, exercises: [
            ExerciseModel(title: "Engage and Enjoy", description: "Use to schedule and engage in activities that are enjoyable or fulfilling.", color: Color.energy, exercises: [])
        ]),
    ]
    
    let moods: [UIImage] = [
        .good, .sad, .shocked, .angry
    ]
    
    var body: some View {
        ZStack {
            Color.bg
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    headerView
                    
                    methodsView
                    
                    moodView
                    
                    helpView
                    
                }
                .padding()
                
            }
        }
    }
    
    var headerView: some View {
        HStack(alignment: .center) {
            Text("Hi, \(authVM.username)")
                .font(.system(size: 25, weight: .bold))
                .padding(.horizontal)
                .padding(.bottom)
            
            Spacer()
            
            NavigationLink {
                SettingsView()
            } label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .rotationEffect(.degrees(-90))
                    .frame(width: 30, height: 7)
                    .foregroundStyle(Color.black)
            }
        }
    }
    
    var methodsView: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("CBT Methods")
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                
                CBTMethodView(cbtMethods: methods)
                    
            }
            NavigationLink {
                ExercisesView(exercises: allExercises())
            } label: {
                VStack {
                    Text("View all")
                        .background {
                            Rectangle()
                                .frame(height: 1)
                                .offset(y:8)
                        }
                        .foregroundStyle(Color.black)
                }
            }
        }
    }
    
    var moodView: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Your Mood Today")
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(moods, id: \.self) { mood in
                            Image(uiImage: mood)
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            NavigationLink {
                
            } label: {
                VStack {
                    Text("View progress")
                        .background {
                            Rectangle()
                                .frame(height: 1)
                                .offset(y:8)
                        }
                        .foregroundStyle(Color.black)
                }
            }
        }
    }
    
    var helpView: some View {
        VStack(alignment: .leading) {
            Text("Get help")
                .font(.system(size: 20, weight: .bold))

            HStack {
                BButton(title: "Call now") {
                    
                }
                .padding(.horizontal)
                BButton(title: "Journal") {
                    
                }
            }
        }
        .padding()
    }
    
    func allExercises() -> [ExerciseModel] {
        var allExercises: [ExerciseModel] = []
        methods.forEach {allExercises += $0.exercises}
        return allExercises
    }
}

#Preview {
    HomeView()
}
