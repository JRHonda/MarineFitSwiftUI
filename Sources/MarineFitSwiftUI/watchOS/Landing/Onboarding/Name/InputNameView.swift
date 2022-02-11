//
//  InputNameView.swift
//  
//
//  Created by Justin Honda on 2/10/22.
//

import SwiftUI

internal struct InputNameView: View {
    
    // MARK: - Binding
    
    @Binding var input: String
    
    // MARK: - Properties
    
    var page: Int { OnboardingState.name.rawValue }
    
    // MARK: - Body
    
    var body: some View {
        TextField("Username", text: $input)
    }
}

// MARK: - Previews

struct InputNameView_Previews: PreviewProvider {
    static var previews: some View {
        InputNameView(input: .constant("Justin"))
    }
}
