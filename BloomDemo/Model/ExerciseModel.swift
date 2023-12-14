//
//  ExerciseModel.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 09.12.23.
//

import SwiftUI

struct ExerciseModel: Equatable {
    let title: String
    let description: String
    let color: Color
    let exercises: [Exercise]
}

struct Exercise: Equatable {
    let title: String
    let image: Image
    let description: String
}
