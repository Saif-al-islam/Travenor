//
//  SignInView.swift
//  Travenor
//
//  Created by Saif on 22/01/2024.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var router: Router
    @StateObject var viewModel = SignInViewModel()
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.backward")
                    .padding(22)
                    .background(Circle().fill(.colorGray1))
                    .onTapGesture {
                        router.pop()
                    }
                Spacer()
            }
            
            Spacer()
            
            Text("sign-in-now")
                .fontWeight(.semibold)
                .font(.custom("sf-ui-display-medium", size: 30, relativeTo: .title))
            
            Text("sign-in-msg")
                .foregroundStyle(.gray)
                .font(.custom("sf-ui-display-medium", size: 16, relativeTo: .title3))
                .padding(.top, 1)

            SpacerH(40)
            
            TextField("email", text: $viewModel.email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textFieldStyle(InputFieldStyle())
            
            SpacerH(24)
            
            PasswordTextFieldView(text: $viewModel.password, title: "password")
                .textFieldStyle(InputFieldStyle(paddingHTrail: 55))
            
            SpacerH(16)
            
            HStack {
                Spacer()
                
                Text("forget-password?")
                    .foregroundStyle(.accent)
                    .font(.custom("sf-ui-display-medium", size: 16, relativeTo: .title2))
                    .padding(4)
                    .onTapGesture {
                        router.nav(to: .ForgetPassword)
                }
            }
            
            SpacerH(40)
            
            Button("sign-in") {
                // TODO: Sign In Func
                if viewModel.isValidate {
                    router.popAllAndNav(to: .Home)
                }
            }
            .buttonStyle(BaseButtonStyle())
            
            SpacerH(40)
            
            HStack {
                Text("dont-have-an-account?")
                    .foregroundStyle(.gray)
                    .font(.custom("sf-ui-display-light", size: 14, relativeTo: .subheadline))
                
                SpacerW(12)
                
                Text("sign-up")
                    .foregroundStyle(.accent)
                    .font(.custom("sf-ui-display-medium", size: 14, relativeTo: .headline))
                    .padding(4)
                    .onTapGesture {
                        router.nav(to: .SignUp)
                    }
            }
            
            SpacerH(20)
            
            Text("or-connect")
                .foregroundStyle(.gray)
                .font(.custom("sf-ui-display-light", size: 14, relativeTo: .subheadline))
            
            Spacer()
            Spacer()
            
            HStack(spacing: 20) {
                Image("ic_facebook")
                Image("ic_instagram")
                Image("ic_twitter")
            }
            
            SpacerH(24)
            
        }
        .padding()
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    SignInView()
}
