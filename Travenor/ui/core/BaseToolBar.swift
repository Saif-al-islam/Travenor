//
//  BaseToolBar.swift
//  Travenor
//
//  Created by Saif on 21/02/2024.
//

import SwiftUI

struct BaseToolBarModifier<VIEW: View>: ViewModifier {
    @EnvironmentObject var router: Router
    
    let title: LocalizedStringKey
    let baseColor: Color
    let trailView: (()->VIEW)?
    
    init(title: LocalizedStringKey, baseColor: Color = .black, trailView: ( () -> VIEW)? = nil) {
        self.title = title
        self.baseColor = baseColor
        self.trailView = trailView
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .foregroundStyle(baseColor)
                        .font(.font_SfUiDisplaySemiBold(size: 18, relativeTo: .title))
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.backward")
                        .size(44)
                        .background(Circle().fill(.gray.opacity(0.16)))
                        .foregroundStyle(baseColor)
                        .onTapGesture {
                            router.pop()
                        }
                }
                
                if let extraView = trailView {
                    ToolbarItem(placement: .topBarTrailing) {
                        extraView()
                    }
                }
            })
    }
    
}


extension View {
    
    func baseToolBar(title: LocalizedStringKey, baseColor: Color = .black, _ trailView: (()->some View)? = nil) -> some View {
        self.modifier(BaseToolBarModifier(title: title, baseColor: baseColor, trailView: trailView))
    }
    
}
