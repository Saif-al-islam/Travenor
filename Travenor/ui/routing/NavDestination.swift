//
//  NavDestination.swift
//  Travenor
//
//  Created by Saif on 22/01/2024.
//

import Foundation
import SwiftUI

enum NavDestination : Codable, Hashable {
    case Splash
    case OnBoarding
    case SignIn
    case SignUp
    case ForgetPassword
    case OTP(email: String)
    case Home
    case TripDetails(id: Int)
}

@ViewBuilder func navToDestinationView(to dest: NavDestination) -> some View {
    switch dest {
    case .Splash:
        SplashView()
    case .OnBoarding:
        OnBoardingView()
    case .SignIn:
        SignInView()
    case .SignUp:
        SignUpView()
    case .Home:
        HomeView()
    case .ForgetPassword:
        ForgetPasswordView()
    case .OTP(let email):
        OtpView(email: email)
    case .TripDetails(let id):
        TripDetailsView(tripId: id)
    }
}
