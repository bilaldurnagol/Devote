//
//  View+.swift
//  Devote
//
//  Created by Bilal Durnagöl on 19.09.2022.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    
    /// to hide the keyboard
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
#endif

