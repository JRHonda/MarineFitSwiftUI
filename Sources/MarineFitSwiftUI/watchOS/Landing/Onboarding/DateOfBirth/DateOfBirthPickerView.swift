//
//  DateOfBirthPickerView.swift
//  
//
//  Created by Justin Honda on 2/11/22.
//

import SwiftUI

internal struct DateOfBirthPickerView: View {
    
    // MARK: - Properties
    
    var page: Int { OnboardingState.dateOfBirth.rawValue }
    
    // MARK: - Body
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: - Previews

struct DateOfBirthPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DateOfBirthPickerView()
    }
}
