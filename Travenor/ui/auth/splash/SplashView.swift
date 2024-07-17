//
//  ContentView.swift
//  Travenor
//
//  Created by Saif on 21/01/2024.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel = SplashViewModel()
    @EnvironmentObject var router: Router

    var body: some View {
        ZStack {
            Color(.accent)
            
            Text("app-name")
                .font(.custom("geometric415BT-BlackA", size: 34))
                .foregroundStyle(.white)
        }.ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    viewModel.isUserLogedIn { isLogged in
                        if isLogged {
                            router.nav(to: .Home)
                        } else {
                            router.nav(to: .OnBoarding)
                        }
                    }
                }
            }
    }
}

#Preview {
    SplashView()
}
