//
//  SignUpView.swift
//  Travenor
//
//  Created by Saif on 22/01/2024.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var router: Router
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        ScrollView {
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
                
                SpacerH(30)
                
                Text("sign-up-now")
                    .font(.custom("sf-ui-display-semibold", size: 26, relativeTo: .title))
                
                Text("sign-up-msg")
                    .foregroundStyle(.gray)
                    .font(.custom("sf-ui-display-light", size: 16, relativeTo: .subheadline))
                    .padding(.top, 1)
                
                SpacerH(40)
                
                TextField("name", text: $viewModel.name)
                    .textContentType(.name)
                    .textFieldStyle(InputFieldStyle())
                                
                SpacerH(24)
                
                TextField("email", text: $viewModel.email)
                    .textContentType(.emailAddress)
                    .textFieldStyle(InputFieldStyle())
                    .keyboardType(.emailAddress)
                
                SpacerH(24)
                
                PasswordTextFieldView(text: $viewModel.password, title: "password")
                    .textFieldStyle(InputFieldStyle(paddingHTrail: 55))
                
                SpacerH(62)
                
                Button("sign-up") {
                    // TODO: Sign UP Func
                    if viewModel.isValidate {
                        router.popAllAndNav(to: .Home)
                    }
                }
                .buttonStyle(BaseButtonStyle())
                
                SpacerH(40)
                
                HStack {
                    Text("have-account-msg")
                        .foregroundStyle(.gray)
                        .font(.custom("sf-ui-display-light", size: 14, relativeTo: .caption))
                    
                    SpacerW(12)
                    
                    Text("sign-in")
                        .foregroundStyle(.accent)
                        .font(.custom("sf-ui-display-medium", size: 14, relativeTo: .headline))
                        .padding(4)
                        .onTapGesture {
                            router.pop()
                        }
                }
                
                SpacerH(20)
                
                Text("or-connect")
                    .foregroundStyle(.gray)
                    .font(.custom("sf-ui-display-light", size: 14, relativeTo: .caption))
                
                SpacerH(36)
                
                HStack(spacing: 20) {
                    Image("ic_facebook")
                    Image("ic_instagram")
                    Image("ic_twitter")
                }
                
                SpacerH(24)
                
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        
    }
    
}

#Preview {
    SignUpView()
}
