//
//  View+extensions.swift
//  
//
//  Created by Justin Honda on 2/4/22.
//

import SwiftUI

public extension View {
    
    func diameter(_ value: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(width: value, height: value, alignment: alignment)
    }
    
    func clippedOverlay<Fill: ShapeStyle, Stroke: ShapeStyle, S: Shape>(_ shape: S, _ fillStyle: Fill, strokeBorder: Stroke, lineWidth: CGFloat = 1) -> some View {
        self
            .clipShape(shape)
            .overlay(
                shape.fill(fillStyle, strokeBorder: strokeBorder, lineWidth: lineWidth)
            )
    }
}


