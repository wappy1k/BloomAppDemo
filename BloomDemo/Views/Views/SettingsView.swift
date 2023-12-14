//
//  SettingsView.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 10.12.23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    let settings: [SettingModel] = [
        SettingModel(title: "Profile Information", action: {
            
        }),
        SettingModel(title: "Privacy Policy", action: {
            
        }),
        SettingModel(title: "About Us", action: {
            
        }),
        SettingModel(title: "Report Problem", action: {
            
        }),
    ]
    
    var body: some View {
        ZStack {
            Color.bg
                .ignoresSafeArea()
            VStack(alignment: .leading){
                title
                generalInfoView
                Spacer()
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
        Text("Settings")
            .font(.system(size: 30, weight: .bold))
            .foregroundStyle(Color.main)
            .padding()
    }
    
    var generalInfoView: some View {
        VStack(alignment: .leading) {
            Text("General Information")
                .font(.system(size: 23, weight: .bold))
                .foregroundStyle(Color.main)
            
            VStack {
                ForEach(settings, id: \.title) { setting in
                    SettingCellView(title: setting.title, action: setting.action)
                }
            }
            .background {
                Color.white
                    .padding(.top, -10)
            }
            .padding(.top)
            
            Button {
                
            } label: {
                HStack {
                    Text("Delete Data")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(Color.red)
                    Spacer()
                }
                    .background {
                        Color.white
                            .padding(.horizontal, -15)
                            .padding(.vertical, -10)
                    }
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
