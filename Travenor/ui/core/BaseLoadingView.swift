//
//  BaseLoadingView.swift
//  Banking
//
//  Created by Saif on 31/01/2024.
//

import SwiftUI

struct BaseLoadingView: View {
    var body: some View {
        ProgressView()
    }
}

#Preview {
    BaseLoadingView()
}

struct BaseLoadingModifier : ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        content.overlay {
            if isLoading {
                BaseLoadingView()
            }
        }
        
    }
}

extension View {
    func baseLoading(isLoading: Bool) -> some View {
        return self.modifier(BaseLoadingModifier(isLoading: isLoading))
    }
}
