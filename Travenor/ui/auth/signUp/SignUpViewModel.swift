//
//  SignupViewModel.swift
//  Banking
//
//  Created by Saif on 28/01/2024.
//

import Foundation

class SignUpViewModel : ObservableObject {
    
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    
    var isValidate: Bool {
        return !email.isEmpty && !password.isEmpty && !name.isEmpty
    }
    
    func signUp() {
        
    }
    
}
