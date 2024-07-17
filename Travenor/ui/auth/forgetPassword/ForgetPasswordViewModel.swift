//
//  ForgetPasswordViewModel.swift
//  Travenor
//
//  Created by Saif on 07/02/2024.
//

import Foundation

class ForgetPasswordViewModel : ObservableObject {
    
    @Published var email: String = ""
    @Published var isLoading: Bool = false
    @Published var emailSentSuccessState = false
    
    func sendEmail() {
        isLoading = true
        
        emailSentSuccessState = true
        
        isLoading = false
    }
    
    
    
    
}
