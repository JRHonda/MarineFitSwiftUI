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

public struct GenderSelectionView: View {
    
    // MARK: - Binding
    
    @Binding var genderSelected: GenderSelection
    
    // MARK: - Properties
    
    public var page: Int { 2 }
    
    // MARK: - Public Init
    
    public init(genderSelected: Binding<GenderSelection>) {
        self._genderSelected = genderSelected
    }
    
    // MARK: - Body
    
    public var body: some View {
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

internal struct GenderSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenderSelectionView(genderSelected: .constant(.male))
    }
}
