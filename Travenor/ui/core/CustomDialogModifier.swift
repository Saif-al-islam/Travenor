//
//  CustomDialogModifier.swift
//  Travenor
//
//  Created by Saif on 07/02/2024.
//

import Foundation
import SwiftUI


struct CustomDialogModifier<DIALOG: View> : ViewModifier {
    
    @Binding var isPresented: Bool
    let isCancellable: Bool
    let dialog: () -> DIALOG
    
    init(isPresented: Binding<Bool>, isCancellable: Bool = true, @ViewBuilder _ dialog: @escaping () -> DIALOG) {
        self._isPresented = isPresented
        self.isCancellable = isCancellable
        self.dialog = dialog
    }
    
    func body(content: Content) -> some View {
        content.overlay {
            if isPresented {
                Color(.black)
                    .opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture {
                        if isCancellable {
                            self.isPresented = false
                        }
                    }
                dialog()
            }
            
        }
    }
    
    
}


extension View {
    
    func customDialog(isPresented: Binding<Bool>, isCancellable: Bool = true, @ViewBuilder _ dialog: @escaping () -> some View) -> some View {
        return self.modifier(CustomDialogModifier(isPresented: isPresented, isCancellable: isCancellable, dialog))
    }
    
}
