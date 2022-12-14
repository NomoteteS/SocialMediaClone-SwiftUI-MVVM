//
//  LoginView.swift
//  TwitterCloneSwiftUI
//
//  Created by NomoteteS on 27.11.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject private var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            //MARK: - Header View
            AuthHeaderView(title1: "Hello", title2: "WellcomeBack")

            VStack(spacing: 40){
                CustomInputField(ImageName: "envelope", placeholder: "Email", text: $email)
                    
                CustomInputField(ImageName: "lock", placeholder: "Password", text: $password)
                
            }
            .padding(.horizontal,12)
            .padding(.top,44)
            
            
            //MARK: - Reset Password
            HStack {
                Spacer()
                
                NavigationLink {
                    // Resetpassword view
                } label: {
                    Text("Forgat Password ?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }.padding()
            }
            
            Button {
                viewModel.login(Email: email, Password: password)
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            }.shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)

                
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account ?")
                    
                    Text("SignUp")
                        .bold()
                }
                .font(.footnote)
                .foregroundColor(.blue)
                .padding()
            }
            .padding(.bottom)


        }.ignoresSafeArea()
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
