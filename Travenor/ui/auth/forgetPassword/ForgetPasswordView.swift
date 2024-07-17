//
//  ForgetPasswordView.swift
//  Travenor
//
//  Created by Saif on 07/02/2024.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    @EnvironmentObject var router: Router
    @StateObject var viewModel = ForgetPasswordViewModel()
    
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
            
            SpacerH(40)
            
            Text("forgot-password")
                .font(.custom("sf-ui-display-semibold", size: 26, relativeTo: .title))
            
            Text("forgot-password-msg")
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
                .font(.custom("sf-ui-display-light", size: 16, relativeTo: .subheadline))
                .padding(.top, 1)
                .frame(maxWidth: 250)
            
            SpacerH(40)
            
            TextField("email", text: $viewModel.email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textFieldStyle(InputFieldStyle())
            
            SpacerH(40)
            
            Button("reset-password") {
                viewModel.sendEmail()
            }
            .buttonStyle(BaseButtonStyle())
            
            Spacer()
            
        }
        .padding()
        .navigationBarBackButtonHidden()
        .baseLoading(isLoading: viewModel.isLoading)
        .customDialog(isPresented: $viewModel.emailSentSuccessState, isCancellable: false) {
            SentEmailSuccessView()
        }
        .onChange(of: viewModel.emailSentSuccessState) { value in
            startTimerNavToOtp()
        }
        
    }
    
    private func startTimerNavToOtp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            router.popAndNav(to: .OTP(email: viewModel.email))
        }
    }
    
}

#Preview {
    ForgetPasswordView()
}
