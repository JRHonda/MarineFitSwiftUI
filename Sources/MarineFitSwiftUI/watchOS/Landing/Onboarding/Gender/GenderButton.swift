//
//  GenderButton.swift
//  
//
//  Created by Justin Honda on 2/10/22.
//

import SwiftUI

public struct GenderButton: View {
    
    // MARK: - Binding
    
    @Binding public var genderSelected: GenderSelection
    
    // MARK: - Properties
    
    private let genderExpected: GenderSelection
    private let action: () -> Void
    
    // MARK: - Public Init
    
    public init(genderSelected: Binding<GenderSelection>, genderExpected: GenderSelection, action: @escaping () -> Void) {
        self._genderSelected = genderSelected
        self.genderExpected = genderExpected
        self.action = action
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button { action() } label: {
            ZStack {
                Color
                    .clear
                    .contentShapedOverlay(Capsule(),
                                          fillButtonIfGender(is: genderExpected),
                                          strokeBorder: Color.MarineCorps.red,
                                          lineWidth: 2)
                Text(genderExpected.rawValue).padding()
            }
        }.buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Private
    
    private func fillButtonIfGender(is gender: GenderSelection) -> Color {
        if genderSelected == genderExpected {
            return .MarineCorps.red.opacity(0.5)
        }
        
        return .clear
    }
}

// MARK: - Previews

struct GenderButton_Previews: PreviewProvider {
    static var previews: some View {
        GenderButton(genderSelected: .constant(.male),
                     genderExpected: .male,
                     action: { })
    }
}
