//
//  SignInView.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 09.12.23.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var authVM = AuthViewModel()
    @Binding var isSignedIn: Bool
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Color.bg
                        .frame(height: 250)
                        .ignoresSafeArea(edges: .top)
                    
                    
                    title
                    
                    textFields
                    
                    loginButton
                    
                    subButtons
                    
                    
                }
            }
            .ignoresSafeArea(edges: [.top])
        }
    }
    
    var title: some View {
        Text("Welcome to Bloom")
            .foregroundStyle(Color.main)
            .font(.system(size: 30, weight: .black))
            .padding()
    }
    
    var textFields: some View {
        VStack {
            BTextField(titleKey: "Email", value: $authVM.email)
            BTextField(titleKey: "Password", value: $authVM.pass, isSecure: true)
        }
    }
    
    var loginButton: some View {
        Button {
           isSignedIn = true
        } label: {
            RoundedRectangle(cornerRadius: Constants.cornerRaius)
                .fill(Color.main)
                .frame(height: 55)
                .overlay {
                    Text("Login")
                        .foregroundStyle(Color.white)
                }
        }
        .padding()
    }
    
    var subButtons: some View {
        VStack(alignment: .leading) {
            Button {
                
            } label: {
                Text("Forgot password?")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.main)
                
            }
            .padding(.bottom)
            
            Button {
                
            } label: {
                Text("Privacy")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.main)
                
            }
        }
        .padding()
    }
}

#Preview {
    SignInView(isSignedIn: .constant(true))
}
