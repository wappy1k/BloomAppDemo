//
//  BTextField.swift
//  BloomDemo
//
//  Created by Vusal Nuriyev 2 on 09.12.23.
//

import SwiftUI

struct BTextField: View {
    @State var titleKey: String = "Email"
    @Binding var value: String
    
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(titleKey)
                .padding(.horizontal)
                .foregroundStyle(Color.gray)
            if !isSecure {
                TextField("", text: $value)
                    .background {
                        RoundedRectangle(cornerRadius: Constants.cornerRaius)
                            .stroke(Color.gray, lineWidth: 1)
                            .padding(.vertical, -15)
                        
                    }
                    .padding()
            }
            else {
                SecureField("", text: $value)
                    .background {
                        RoundedRectangle(cornerRadius: Constants.cornerRaius)
                            .stroke(Color.gray, lineWidth: 1)
                            .padding(.vertical, -15)
                        
                    }
                    .padding()
            }
        }
    }
}

#Preview {
    BTextField(value: .constant(""))
}
