//
//  AuthViewModel.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 09.12.23.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var pass: String = ""
    @Published var username: String = "@username"
}
