//
//  SettingToggle.swift
//  
//
//  Created by Justin Honda on 2/5/22.
//

import SwiftUI

internal struct SettingToggle: View {
    
    @Binding private var isOn: Bool
    private let text: String
    private let systemImageName: String
    
    internal init(_ isOn: Binding<Bool>, _ text: String, _ systemImageName: String) {
        self._isOn = isOn
        self.text = text
        self.systemImageName = systemImageName
    }
    
    var body: some View {
        HStack {
            Toggle(isOn: $isOn) {
                Image(systemName: systemImageName)
                Text(text)
            }
            .foregroundColor(Color.MarineCorps.yellow)
            .padding()
        }
        .clippedOverlay(RoundedRectangle(cornerRadius: 16),
                        .clear,
                        strokeBorder: .red,
                        lineWidth: 2)
    }
    
}
