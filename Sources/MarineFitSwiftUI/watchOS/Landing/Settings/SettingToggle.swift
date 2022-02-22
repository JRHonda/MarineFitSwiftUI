//
//  SettingToggle.swift
//  
//
//  Created by Justin Honda on 2/5/22.
//

import SwiftUI

internal struct SettingToggle: View {
    
    @Binding var isOn: Bool
    @State private var isSheetShowing: Bool = false
    private let toggleText: String
    private let infoText: String
    
    internal init(_ isOn: Binding<Bool>, text: String, infoText: String) {
        self._isOn = isOn
        self.toggleText = text
        self.infoText = infoText
    }
    
    var body: some View {
        HStack {
            Toggle(isOn: $isOn) {
                Image(systemName: "info.circle")
                    .onTapGesture {
                        isSheetShowing.toggle()
                    }
                    .sheet(isPresented: $isSheetShowing) {
                        ScrollView {
                            Text(infoText)
                        }.padding()
                    }
                
                Text(toggleText)
            }
            .foregroundColor(.MarineCorps.yellow)
            .padding()
        }
        .contentShapedOverlay(RoundedRectangle(cornerRadius: 16),
                        .clear,
                        strokeBorder: Color.MarineCorps.red,
                        lineWidth: 2)
    }
    
}

struct SettingToggle_Previews: PreviewProvider {
    static var previews: some View {
        SettingToggle(.constant(false),
                      text: "Test?",
                      infoText: "This is a test toggle!")
    }
}
