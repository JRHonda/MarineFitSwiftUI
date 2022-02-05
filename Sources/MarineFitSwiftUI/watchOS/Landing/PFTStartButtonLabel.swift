//
//  PFTStartButtonLabel.swift
//  
//
//  Created by Justin Honda on 2/4/22.
//

import SwiftUI

/// Circle button style to allow a user to start a PFTSession
///
/// **NOTE** Will produce circle or square, even if passing in capsule or rectangle.
public struct PFTStartButtonLabel<S: Shape, Fill: ShapeStyle>: View {
    
    private let text: String
    private let diameter: CGFloat
    private let shape: S
    private let fill: Fill
    
    public init(text: String, diameter: CGFloat, shape: S, fill: Fill) {
        self.text = text
        self.diameter = diameter
        self.shape = shape
        self.fill = fill
    }
    
    public var body: some View {
        ZStack {
            // added to zstack to render text above
            shape
            // required to allow clear or filled
                .fill(.clear)
                .diameter(diameter)
            // supports building filled or unfilled shape
                .clippedOverlay(shape,
                                fill,
                                strokeBorder: Color.MarineCorps.red,
                                lineWidth: 2)
            
            // placed here to ensure text always renders above shape (filled or not)
            Text(text)
                .foregroundColor(Color.MarineCorps.yellow)
                .font(.mfDefaultSystem())
        }
    }
}

struct PFTStartButton_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            PFTStartButtonLabel(text: "START", diameter: proxy.size.width / 1.5, shape: Circle(), fill: .clear)
                .frame(width: proxy.size.width,
                       height: proxy.size.height)
        }
    }
}


