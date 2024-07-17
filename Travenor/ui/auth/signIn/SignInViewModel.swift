//
//  SignInViewModel.swift
//  Travenor
//
//  Created by Saif on 06/02/2024.
//

import Foundation

class SignInViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    var isValidate: Bool {
        return !email.isEmpty && !password.isEmpty
    }
    
    func logIn() {
        
    }
    
}
