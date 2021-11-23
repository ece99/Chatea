//
//  LoginView.swift
//  Chatea
//
//  Created by Ece Ayvaz on 20.10.2021.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    //@ObservedObject var viewModel = AuthViewModel()
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    HStack { Spacer() }
                    
                    Text("Chatea")
                        .font(.largeTitle)
                        .bold()
                    
                    VStack(spacing: 20) {
                        TextField("Email",text: $email)
                        Divider()
                            .background(Color(.darkGray))
                        
                        SecureField("Password",text: $password)
                        Divider()
                            .background(Color(.darkGray))
                    }
                    .padding([.top, .horizontal], 32)
                    
                    
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 340, height: 50)
                            .background(Color.blue)
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    NavigationLink(
                        destination: UploadPhotoView(),
                        isActive: $viewModel.didAuthenticationUser,
                        label: {
                            HStack{
                                Button(action: {
                                    viewModel.register(withEmail: email, password: password)
                                }, label: {
                                    Text("Don't have an account?")
                                        .font(.system(size: 14))
                                        .foregroundColor(.blue)
                                    
                                    Text("Sign Up")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.blue)
                                })
                            }
                            
                        })
                    /* NavigationLink(
                     destination: RegistrationView(),
                     label: {
                     Text("Don't have an account?")
                     .font(.system(size: 14))
                     .foregroundColor(.blue)
                     
                     Text("Sign Up")
                     .font(.system(size: 14, weight: .semibold))
                     .foregroundColor(.blue)
                     })*/
                }
                .padding(.leading)
            }
            .padding(.top, -56)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
