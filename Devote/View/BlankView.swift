//
//  BlankView.swift
//  Devote
//
//  Created by Bilal Durnagöl on 19.09.2022.
//

import SwiftUI

struct BlankView: View {
    
    // MARK: - Properties
    
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    
    var body: some View {
        backgroundColor
            .opacity(backgroundOpacity)
            .blendMode(.overlay)
            .ignoresSafeArea(.all)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: .black, backgroundOpacity: 0.3)
            .background {
                BackgroundImageView()
            }
            .background {
                backgroundGradient.ignoresSafeArea()
            }
    }
}
