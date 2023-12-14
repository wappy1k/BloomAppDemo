//
//  ContentView.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 09.12.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var isSignedId: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if isSignedId {
                    HomeView()
                } else {
                    SignInView(isSignedIn: $isSignedId)
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
