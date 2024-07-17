//
//  SentEmailSuccessView.swift
//  Travenor
//
//  Created by Saif on 07/02/2024.
//

import SwiftUI

struct SentEmailSuccessView: View {
    var body: some View {
        VStack {
            Image("ic_email")
                .padding()
                .background(Circle().fill(.accent))
            
            SpacerH(20)
            
            Text("check-your-email")
                .font(.custom("sf-ui-display-semibold", size: 18, relativeTo: .title))
            
            SpacerH(8)
            
            Text("send-email-success-msg")
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
                .font(.custom("sf-ui-display-light", size: 16, relativeTo: .subheadline))
                .padding(.top, 1)
                .frame(maxWidth: 250)
            
        }
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(.white)
                .shadow(radius: 3)
        )
    }
}

#Preview {
    SentEmailSuccessView()
}
