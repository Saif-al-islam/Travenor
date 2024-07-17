//
//  OnBoardingView.swift
//  Travenor
//
//  Created by Saif on 22/01/2024.
//

import SwiftUI

struct OnBoardingView: View {
    
    @EnvironmentObject var router: Router
    @State var selectedPage: Int = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                TabView(selection: $selectedPage.animation()) {
                    onBoardingItemView(image: "im-onboarding-1", title: "onboarding-1-title", titleWord: "wide",
                                       description: "onboarding-1-desc")
                    .tag(0)
                    onBoardingItemView(image: "im-onboarding-2", title: "onboarding-2-title", titleWord: "explore", description: "onboarding-2-desc")
                        .tag(1)
                    onBoardingItemView(image: "im-onboarding-3", title: "onboarding-3-title", titleWord: "people", description: "onboarding-3-desc")
                        .tag(2)
                }
                .padding(.top, -155)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                Spacer()
                    .frame(height: 23)
                
                PageIndicatorView(selectedPageIndex: $selectedPage, pageCount: 3)
                
                Spacer()
                    .frame(height: 34)
                
                MainButton(label: (selectedPage == 0) ? "get-started" : "next") {
                    if selectedPage == 2 {
                        router.nav(to: .SignIn)
                    } else {
                        selectedPage += 1
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
            
            Button("skip") {
                router.nav(to: .SignIn)
            }
            .foregroundColor(Color("color-blue-1"))
            .background(RadialGradient(colors: [.gray.opacity(0.5), .white.opacity(0)], center: .center, startRadius: 0, endRadius: 25))
            .padding()
        }.navigationBarBackButtonHidden()
    }
    
}

struct onBoardingItemView: View {
    
    let image: String
    let title: LocalizedStringKey
    let titleWord: LocalizedStringKey
    let description: LocalizedStringKey
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 444)
            
            Spacer()
                .frame(height: 40)
            
            (
                Text(title)
                    .font(.custom("geometric415BT-BlackA", size: 30))
                + Text(titleWord)
                    .font(.custom("geometric415BT-BlackA", size: 30))
                    .foregroundColor(Color("color-orange-1"))
                
            )
            .multilineTextAlignment(.center)
            
            
            Text(description)
                .font(.custom("gill-sans-mt", size: 16))
                .foregroundStyle(Color("gray-color-1"))
                .lineSpacing(8)
                .multilineTextAlignment(.center)
                .padding()
            
        }
        
    }
    
}



#Preview {
    OnBoardingView()
}




