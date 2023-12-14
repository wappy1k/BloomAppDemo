//
//  CBTMethodViewModel.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 10.12.23.
//

import SwiftUI

class CBTMethodViewModel: ObservableObject {
    @Published var selectedMethod: CBTMethodModel?
    
    // - Dummy Data
    let cbtMethods: [CBTMethodModel] = [
        CBTMethodModel(title: "Find Balance", image: Image(uiImage: UIImage.balance), color: Color.balance, exercises: [
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
}
