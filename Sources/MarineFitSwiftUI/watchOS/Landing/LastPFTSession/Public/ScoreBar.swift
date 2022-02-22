//
//  ScoreBar.swift
//  
//
//  Created by Justin Honda on 2/18/22.
//

import SwiftUI

/// Score bar to visually represent a user's score for a particular event
public struct ScoreBar: View {
    
    // MARK: - Properties
    
    private var scorePercentage: CGFloat {
        let maxScore: CGFloat
        if event.eventName.lowercased() == "pushups" {
            maxScore = 70
        } else {
            maxScore = 100
        }
        return CGFloat(event.pftScore) / maxScore
    }
    
    private var eventTypeColor: Color {
        return event.category?.mapToColor() ?? .red
    }
    
    internal let event: PFTEventDataModelAdapter
    
    // MARK: - Public Init
    
    init(event: PFTEventDataModelAdapter) {
        self.event = event
    }
    
    // MARK: - Body
    
    public var body: some View {
        ZStack {
            GeometryReader { proxy in
                Color.clear
                    .contentShapedOverlay(Capsule(),
                                    eventTypeColor,
                                    strokeBorder: .clear,
                                    lineWidth: 0)
                    .opacity(0.25)
                
                Color.clear
                    .contentShapedOverlay(Capsule(),
                                    eventTypeColor,
                                    strokeBorder: .clear,
                                    lineWidth: 0)
                    .frame(width: proxy.size.width * scorePercentage)
            }
        }.padding(.trailing, 8)
    }
}

// MARK: - Previews

internal struct ScoreBar_Previews: PreviewProvider {
    static let event = PFTEventDataModelAdapter(categoryName: "Upperbody", eventName: "Pushups", eventScore: "81", pftScore: 63)
    static var previews: some View {
        ScoreBar(event: event)
            .frame(height: 30)
    }
}
