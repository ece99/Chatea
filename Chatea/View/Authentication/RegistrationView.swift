//
//  RegistrationView.swift
//  Chatea
//
//  Created by Ece Ayvaz on 10.11.2021.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack { Spacer() }
                
                Text("Create your account.")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
    
                VStack(spacing: 40) {
                    TextField("Email",text: $email)
                    Divider()
                        .background(Color(.darkGray))
                    TextField("Username",text: $username)
                    Divider()
                        .background(Color(.darkGray))
                        .background(Color(.darkGray))
                    SecureField("Password",text: $password)
                    Divider()
                        .background(Color(.darkGray))
                    
                }
                .padding([.top, .horizontal], 32)
            }
            .padding(.leading)
            
            Button(action: {
                viewModel.register(withEmail: email, password: password)
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            })
            .padding(.top, 24)
            
            Spacer()

        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
