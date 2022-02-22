//
//  PFTScoreButtonOnTopOfPFTScoreButtonView.swift
//  
//
//  Created by Justin Honda on 2/21/22.
//

import SwiftUI

/// internal prototyping only
internal struct PFTScoreButtonOnTopOfPFTScoreButtonView: View {
    
    // MARK: - State
    
    @State private var isActive: Bool = false
    @State private var isEventComplete: Bool = true
    
    // MARK: - Properties
    
    internal let event: PFTEventDataModelAdapter = .init(categoryName: "Cardio",
                                                         eventName: "Run",
                                                         eventScore: "18:12",
                                                         pftScore: 100)
    
    // MARK: - Body
    
    var body: some View {
        PFTSessionNavigationLink(isActive: $isActive,
                                 isEventComplete: $isEventComplete,
                                 event: event,
                                 destination: Text("Running"),
                                 pftScoreBadge: PFTSessionEventScoreButton(event: event))
            .frame(width: 75, height: 75)
    }
}

// MARK: - Previews

internal struct PFTScoreButtonOnTopOfPFTScoreButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PFTScoreButtonOnTopOfPFTScoreButtonView()
        }
        #if !os(macOS)
        .navigationViewStyle(.stack)
        #endif
    }
}
