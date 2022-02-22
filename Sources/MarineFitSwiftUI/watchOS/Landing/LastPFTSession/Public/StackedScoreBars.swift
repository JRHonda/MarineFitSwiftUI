//
//  StackedScoreBars.swift
//  
//
//  Created by Justin Honda on 2/19/22.
//

import SwiftUI

/// Score bars stacked to visually represent a user's score in each PFT event
public struct StackedScoreBars: View {
    
    // MARK: - Properties
    
    private var totalScore: Int {
        events
            .compactMap { $0.pftScore }
            .reduce(0, +)
    }
    
    internal let events: [PFTEventDataModelAdapter]
    
    // MARK: - Public Init
    
    public init(events: [PFTEventDataModelAdapter]) {
        self.events = events
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack {
            HStack {
                VStack(spacing: 8) {
                    Group {
                        ForEach(events, id: \.eventName) {
                            ScoreBar(event: $0)
                        }
                    }.frame(height: 30)
                }.padding(.trailing, 8)
                
                VStack(alignment: .trailing, spacing: 8) {
                    Group {
                        ForEach(events, id: \.eventName) {
                            Text("\($0.pftScore)")
                                .foregroundColor($0.category?.mapToColor())
                        }
                    }
                    .font(.headline)
                    .frame(height: 30)
                }
            }
            
            HStack(alignment: .lastTextBaseline) {
                Text("PFT Score").font(.title3)
                Spacer()
                Text("\(totalScore)").font(.title2)
            }
        }
    }
}

// MARK: - Previews

internal struct StackedScoreBars_Previews: PreviewProvider {
    static var previews: some View {
        StackedScoreBars(events: pftEvents_Internal.sorted())
    }
}
