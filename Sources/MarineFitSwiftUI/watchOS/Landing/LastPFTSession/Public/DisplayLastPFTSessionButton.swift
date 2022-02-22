//
//  DisplayLastPFTSessionButton.swift
//  
//
//  Created by Justin Honda on 2/20/22.
//

import SwiftUI

public struct DisplayLastPFTSessionButton: View {
    
    // MARK: - Private State
    
    @State private var isSheetPresented: Bool = false
    
    // MARK: - Properties
    
    private let lastPFTSession: PFTSessionDataModelAdapter
    
    // MARK: - Public Init
    
    public init(lastPFTSession: PFTSessionDataModelAdapter) {
        self.lastPFTSession = lastPFTSession
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button {
            isSheetPresented.toggle()
        } label: {
            LandingSubActionButtonLabel(systemImageName: "heart.text.square")
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $isSheetPresented) {
            // action to perform upon dismissal
            // No plans yet to use this functionality in MarineFit
        } content: {
            LastPFTSessionView(lastPFTSession: lastPFTSession)
                .padding()
        }
    }
}

// MARK: - Previews

internal struct DisplayLastPFTSessionButton_Previews: PreviewProvider {
    static var previews: some View {
        DisplayLastPFTSessionButton(lastPFTSession: lastPFTSession_Internal)
    }
}
