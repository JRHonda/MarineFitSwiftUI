//
//  SettingsSheetView.swift
//  
//
//  Created by Justin Honda on 2/5/22.
//

import SwiftUI

internal struct SettingsSheetView<Settings: SettingsProvider>: View {
    
    @EnvironmentObject private var settings: Settings
    
    var body: some View {
        ScrollView {
            SettingToggle($settings.isForceAltitudeOn,
                          text: "Force altitude?",
                          infoText: "Turn this setting on if you know for sure that you will be performing a PFT event above 5000ft.")
        }.padding()
    }
    
}

struct SettingsSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSheetView<SettingsProviderImpl_Internal>()
            .environmentObject(SettingsProviderImpl_Internal())
    }
}
