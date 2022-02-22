//
//  PFTSessionLandingView.swift
//  
//
//  Created by Justin Honda on 2/21/22.
//

import SwiftUI
#if os(watchOS)
import WatchKit
#endif

/// prototype only    
internal struct PFTSessionLandingView: View {
    
    // MARK: - State
    
    @State private var isActive: Bool = false
    @State private var tabSelected: String = "One"
    @State private var isEventComplete: Bool = true
    
    // MARK: - Properties
    
    private let runEvent = PFTEventDataModelAdapter(categoryName: "Cardio", eventName: "Run", eventScore: "18:12", pftScore: 98)
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                
                VStack {
                    
                    HStack(spacing: 8) {
                        PFTSessionNavigationLink(isActive: $isActive,
                                                 isEventComplete: $isEventComplete,
                                                 event: lastPFTSession_Internal.events.first(where: { $0.eventName == "Run" })!,
                                                 destination: Text("Active Run Session"),
                                                 pftScoreBadge: PFTSessionEventScoreButton(event: lastPFTSession_Internal.events.first(where: { $0.eventName == "Run" })!)
                        )
                        
                        PFTSessionNavigationLink(isActive: $isActive,
                                                 isEventComplete: $isEventComplete,
                                                 event: lastPFTSession_Internal.events.first(where: { $0.eventName == "Pullups" })!,
                                                 destination: Text("Active Run Session"),
                                                 pftScoreBadge: PFTSessionEventScoreButton(event:  lastPFTSession_Internal.events.first(where: { $0.eventName == "Pullups" })!))
                    }.padding(4)
                    
                    HStack(spacing: 8) {
                        PFTSessionNavigationLink(isActive: $isActive,
                                                 isEventComplete: $isEventComplete,
                                                 event: lastPFTSession_Internal.events.first(where: { $0.eventName == "Crunches" })!,
                                                 destination: Text("Active Run Session"),
                                                 pftScoreBadge: PFTSessionEventScoreButton(event:lastPFTSession_Internal.events.first(where: { $0.eventName == "Crunches" })!))
                        PFTSessionNavigationLink(isActive: $isActive,
                                                 isEventComplete: $isEventComplete,
                                                 event: runEvent,
                                                 destination: Text("Active Run Session"),
                                                 pftScoreBadge: PFTSessionEventScoreButton(event: runEvent))
                    }.padding(4)
                    
                }.padding()
                
                
            }
#if !os(macOS)
            .navigationViewStyle(.stack)
#endif
            .navigationTitle("MarineFit")
        }
    }
}

// MARK: - Previews

internal struct PFTSessionLandingView_Previews: PreviewProvider {
    static var previews: some View {
        PFTSessionLandingView()
    }
}
