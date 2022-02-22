//
//  LastPFTSessionView.swift
//  
//
//  Created by Justin Honda on 2/19/22.
//

import SwiftUI

/// Will display data for the user's latest PFT event completed
public struct LastPFTSessionView: View {
    
    // MARK: - Properties
    
    internal let lastPFTSession: PFTSessionDataModelAdapter
    
    // MARK: - Public Init
    
    public init(lastPFTSession: PFTSessionDataModelAdapter) {
        self.lastPFTSession = lastPFTSession
    }
    
    // MARK: - Body
    
    public var body: some View {
        // events sorted with highest PFT score at top
        let sortedEvents = lastPFTSession.events.sorted()
        
        ScrollView {
            VStack {
                HStack {
                    Text(lastPFTSession.date)
                    Spacer()
                }
                
                StackedScoreBars(events: sortedEvents)
                
                HStack {
                    VStack(spacing: 8) {
                        Group {
                            // UI/UX: Reversed to link bottom bar color with text color since screen is so small. (when scrolling)
                            ForEach(sortedEvents.reversed(), id: \.eventName) { event in
                                HStack {
                                    EventScoreView(eventName: event.eventName,
                                                   eventScore: event.eventScore,
                                                   scoreColor: event.category?.mapToColor() ?? .green)
                                    
                                    Spacer()
                                }
                            }
                        }
                        .cornerRadius(8)
                    }
                    Spacer()
                }.padding(.top, 1)
            }
        }
    }
}

// MARK: - Previews

internal struct LastPFTSessionView_Previews: PreviewProvider {
    static var previews: some View {
        LastPFTSessionView(lastPFTSession: lastPFTSession_Internal).padding()
    }
}

