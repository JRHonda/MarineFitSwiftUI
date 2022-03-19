//
//  PageDotView.swift
//  
//
//  Created by Justin Honda on 2/7/22.
//

import SwiftUI

public struct PageDotView: View {
    
    // MARK: - Properties
    
    let hasFinishedPage: Bool
    let diameter: CGFloat
    
    public init(hasFinishedPage: Bool, diameter: CGFloat = 16) {
        self.hasFinishedPage = hasFinishedPage
        self.diameter = diameter
    }
    
    // MARK: - Body
    
    public var body: some View {
        let fillStyle = hasFinishedPage ? Color.MarineCorps.red : .clear
        
        dotView(with: fillStyle)
    }
    
    // MARK: - ViewBuilders
    
    @ViewBuilder
    private func dotView<Fill: ShapeStyle>(with fillStyle: Fill) -> some View {
        Color.clear
            .diameter(diameter)
            .contentShapedOverlay(
                Circle(),
                fillStyle,
                strokeBorder: Color.MarineCorps.red,
                lineWidth: 1
            )
    }
}

// MARK: - Previews

struct PageDotView_Previews: PreviewProvider {
    static var previews: some View {
        PageDotView(hasFinishedPage: false)
    }
}
