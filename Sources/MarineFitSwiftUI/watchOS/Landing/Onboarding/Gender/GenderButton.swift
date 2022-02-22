//
//  GenderButton.swift
//  
//
//  Created by Justin Honda on 2/10/22.
//

import SwiftUI

internal struct GenderButton: View {
    
    // MARK: - Binding
    
    @Binding var genderSelected: GenderSelection
    
    // MARK: - Properties
    
    let genderExpected: GenderSelection
    let action: () -> Void
    
    // MARK: - Body
    
    var body: some View {
        Button {
            action()
        } label: {
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
