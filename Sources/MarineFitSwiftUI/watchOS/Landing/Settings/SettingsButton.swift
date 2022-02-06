//
//  SettingsButton.swift
//  
//
//  Created by Justin Honda on 2/5/22.
//

import SwiftUI

public struct SettingsButton: View {
    
    // MARK: - Properties
    
    /// Bind this property to view model in MarineFit to perform an action
    @Binding public var isForceAltitudeOn: Bool
    
    @State private var isSheetPresented: Bool = false
    
    // MARK: - Public Init
    
    public init(_ isForceAltitudeOn: Binding<Bool>) {
        self._isForceAltitudeOn = isForceAltitudeOn
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button {
            isSheetPresented.toggle()
        } label: {
            LandingSubActionButtonLabel(systemImageName: "gear")
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $isSheetPresented) {
            // action to perform upon dismissal
            // No plans yet to use this functionality in MarineFit
        } content: {
            SettingsSheetView($isForceAltitudeOn)
        }
    }
}

// MARK: - Previews

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton(.constant(false))
    }
}
