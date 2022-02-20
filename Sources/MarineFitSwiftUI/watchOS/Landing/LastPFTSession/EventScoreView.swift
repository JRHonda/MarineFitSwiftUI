//
//  EventScoreView.swift
//  
//
//  Created by Justin Honda on 2/19/22.
//

import SwiftUI

/// Stacked texts to show the event and the specific event score (run -> 18:12 eighteen minutes and twelve seconds)
public struct EventScoreView: View {
    
    // MARK: - Properties
    
    internal let eventName: String
    internal let eventScore: String
    internal let scoreColor: Color
    
    // MARK: - Public Init
    
    public init(eventName: String, eventScore: String, scoreColor: Color) {
        self.eventName = eventName
        self.eventScore = eventScore
        self.scoreColor = scoreColor
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(eventName)
                .font(.system(size: 14))
            Text(eventScore)
                .foregroundColor(scoreColor)
                .font(.title3)
        }
    }
}

// MARK: - Previews

struct EventScoreView_Previews: PreviewProvider {
    static var previews: some View {
        EventScoreView(eventName: "Run", eventScore: "18:12", scoreColor: .green)
    }
}
