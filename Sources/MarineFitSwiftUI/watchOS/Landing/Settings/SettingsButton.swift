//
//  SettingsButton.swift
//  
//
//  Created by Justin Honda on 2/5/22.
//

import SwiftUI

public struct SettingsButton<Settings: SettingsProvider>: View {
    
    // MARK: - EnvironmentObject
    
    @EnvironmentObject var settings: Settings
    
    // MARK: - Properties
    
    @State private var isSheetPresented: Bool = false
    
    // MARK: - Public Init
    
    public init() { }
    
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
            SettingsSheetView<Settings>()
        }
        .environmentObject(settings)
    }
}

// MARK: - Previews

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton<SettingsProviderImpl_Internal>()
            .environmentObject(SettingsProviderImpl_Internal())
    }
}
