//
//  SplashViewModel.swift
//  Travenor
//
//  Created by Saif on 23/01/2024.
//

import Foundation


class SplashViewModel : ObservableObject {
    
    func isUserLogedIn(listener: @escaping (Bool)->Void) {
        listener(false)
    }
    
}
