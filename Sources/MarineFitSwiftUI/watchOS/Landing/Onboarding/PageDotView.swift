//
//  PageDotView.swift
//  
//
//  Created by Justin Honda on 2/7/22.
//

import SwiftUI

struct PageDotView: View {
    
    // MARK: - Properties
    
    let hasFinishedPage: Bool
    let diameterConstant: CGFloat = 16
    
    // MARK: - Body
    
    var body: some View {
        Color.clear
            .diameter(diameterConstant)
            .contentShapedOverlay(Circle(),
                            hasFinishedPage
                            ? Color.MarineCorps.red
                            : .clear,
                            strokeBorder: Color.MarineCorps.red,
                            lineWidth: 1)
    }
}

// MARK: - Previews

struct PageDotView_Previews: PreviewProvider {
    static var previews: some View {
        PageDotView(hasFinishedPage: false)
    }
}
