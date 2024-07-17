//
//  OtpView.swift
//  Travenor
//
//  Created by Saif on 07/02/2024.
//

import SwiftUI

struct OtpView: View {
    let email: String
    
    @EnvironmentObject var router: Router
    @StateObject var viewModel = OtpViewModel()
    
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
            
            Text("otp-verification")
                .font(.custom("sf-ui-display-semibold", size: 26, relativeTo: .title))
            
            Group {
                Text("otp-verfication-msg-1")
                + Text(" \(email) ")
                    .foregroundColor(.black)
                + Text("otp-verfication-msg-2")
            }
            .multilineTextAlignment(.center)
            .foregroundStyle(.gray)
            .font(.custom("sf-ui-display-light", size: 16, relativeTo: .subheadline))
            .padding(.top, 1)
            
            SpacerH(40)
            
            Text("otp-code")
                .font(.custom("sf-ui-display-semibold", size: 20, relativeTo: .title))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            SpacerH(16)
            
            HStack(spacing: 18) {
                TextField("", text: $viewModel.code1)
                    .maxLength(limit: 1, value: $viewModel.code1)
                                
                TextField("", text: $viewModel.code2)
                    .maxLength(limit: 1, value: $viewModel.code2)
                
                TextField("", text: $viewModel.code3)
                    .maxLength(limit: 1, value: $viewModel.code3)
                
                TextField("", text: $viewModel.code4)
                    .maxLength(limit: 1, value: $viewModel.code4)
            }
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .textFieldStyle(InputFieldStyle())
            
            SpacerH(40)
            
            Button("verify") {
                viewModel.sendOtpCode()
            }
            .buttonStyle(BaseButtonStyle())
            
            SpacerH(16)
            
            HStack {
                Text("resend-code-to")
                    .font(.custom("sf-ui-display-light", size: 14, relativeTo: .headline))
                    .onTapGesture {
                        viewModel.resendEmailVerification()
                    }
                    .disabled(viewModel.isTimerRunning)

                Spacer()
                
                Text("\(viewModel.timerInSec)")
                    .font(.custom("sf-ui-display-light", size: 14, relativeTo: .subheadline))
                
            }
            
            Spacer()
            
        }
        .padding()
        .navigationBarBackButtonHidden()
        .baseLoading(isLoading: viewModel.isLoading)
        .onAppear {
            viewModel.startTimer()
        }
        .onChange(of: viewModel.otpCodeSuccessState) { value in
            router.popAndNav(to: .SignIn)
        }
        
    }
}

#Preview {
    OtpView(email: "saif@gmail.com")
}

 
