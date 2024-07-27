//
//  MainButton.swift
//  Travenor
//
//  Created by Saif on 22/01/2024.
//

import SwiftUI

struct MainButton: View {
    let label: LocalizedStringKey
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(label)
                .font(.custom("sf-ui-display-medium", size: 16))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
        })
        .buttonStyle(.borderedProminent)
        .padding(.horizontal)
        
    }
}

#Preview {
    MainButton(label: "Next") {
        
    }
}
