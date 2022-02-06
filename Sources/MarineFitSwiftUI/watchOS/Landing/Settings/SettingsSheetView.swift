//
//  SettingsSheetView.swift
//  
//
//  Created by Justin Honda on 2/5/22.
//

import SwiftUI

internal struct SettingsSheetView: View {
    
    @Binding var isForceAltitudeOn: Bool
    
    internal init(_ isForceAltitudeOn: Binding<Bool>) {
        self._isForceAltitudeOn = isForceAltitudeOn
    }
    
    var body: some View {
        ScrollView {
            SettingToggle($isForceAltitudeOn,
                          "Force altitude?",
                          "info.circle")
        }.padding()
    }
    
}

struct SettingsSheetView_Previews: PreviewProvider {
    @State static var isForceAltitudeOn: Bool = false
    static var previews: some View {
        SettingsSheetView($isForceAltitudeOn)
    }
}
