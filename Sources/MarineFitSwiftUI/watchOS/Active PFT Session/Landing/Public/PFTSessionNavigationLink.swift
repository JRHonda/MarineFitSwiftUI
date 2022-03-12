//
//  PFTSessionNavigationLink.swift
//  
//
//  Created by Justin Honda on 2/20/22.
//

import SwiftUI

/// Used to start a particular PFT event like "Run", "Pullups", or "Review" (finishing a PFT session)
public struct PFTSessionNavigationLink<Destination: View, PFTScoreBadge: View>: View {
    
    // MARK: - Binding
    
    @Binding public var isActive: Bool
    @Binding public var isEventComplete: Bool
    
    // MARK: - Properties
    
    public let event: PFTEventDataModelAdapter
    public let destination: Destination
    public let pftScoreBadge: PFTScoreBadge
    
    // MARK: - Public Init
    
    public init(isActive: Binding<Bool>,
                isEventComplete: Binding<Bool>,
                event: PFTEventDataModelAdapter,
                destination: Destination,
                pftScoreBadge: PFTScoreBadge) {
        self._isActive = isActive
        self._isEventComplete = isEventComplete
        self.event = event
        self.destination = destination
        self.pftScoreBadge = pftScoreBadge
    }
    
    // MARK: - Body
    
    public var body: some View {
        GeometryReader { proxy in
            NavigationLink(isActive: $isActive) {
                self.destination
#if !os(macOS)
                    .navigationBarBackButtonHidden(!isEventComplete)
#endif
            } label: {
                ZStack {
                    Color
                        .clear
                        .contentShapedOverlay(RoundedRectangle(cornerRadius: 16),
                                              .clear,
                                              strokeBorder: Color.MarineCorps.red,
                                              lineWidth: 1)
                    
                    Text(event.eventName)
                        .foregroundColor(.MarineCorps.yellow)
                    
                    if isEventComplete {
                        pftScoreBadge
                            .frame(height: proxy.size.height * 0.2)
                            .frame(idealWidth: proxy.size.width * 0.6,
                                   maxWidth: proxy.size.width * 0.75)
                            .offset(x: 0, y: -proxy.size.height / 2)
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

// MARK: - Previews

internal struct PFTSessionLandingButton_Previews: PreviewProvider {
    
    @State private static var isActive: Bool = false
    @State private static var isEventComplete: Bool = true
    private static let event = PFTEventDataModelAdapter.init(categoryName: "Cardio",
                                                      eventName: "Run",
                                                      eventScore: "18:12",
                                                      pftScore: 98)
    
    static var previews: some View {
        NavigationView {
            PFTSessionNavigationLink(isActive: $isActive,
                                     isEventComplete: $isEventComplete,
                                     event: event,
                                     destination: Text("Running"),
            pftScoreBadge: PFTSessionEventScoreButton(event: event))
        }
#if !os(macOS)
        .navigationViewStyle(.stack)
#endif
    }
}
