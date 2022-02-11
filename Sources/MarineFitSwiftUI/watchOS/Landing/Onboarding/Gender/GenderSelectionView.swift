//
//  GenderSelectionView.swift
//  
//
//  Created by Justin Honda on 2/10/22.
//

import SwiftUI

public enum GenderSelection: String {
    case none = ""
    case male = "M"
    case female = "F"
}

internal struct GenderSelectionView: View {
    
    // MARK: - Binding
    
    @Binding var genderSelected: GenderSelection
    
    // MARK: - Properties
    
    var page: Int { OnboardingState.gender.rawValue }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Gender?")
            HStack(spacing: 8) {
                GenderButton(genderSelected: $genderSelected, genderExpected: .male, action: { genderSelected = .male })
                GenderButton(genderSelected: $genderSelected, genderExpected: .female, action: { genderSelected = .female })
            }.padding()
        }
    }
}

// MARK: - Previews

struct GenderSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenderSelectionView(genderSelected: .constant(.male))
    }
}
