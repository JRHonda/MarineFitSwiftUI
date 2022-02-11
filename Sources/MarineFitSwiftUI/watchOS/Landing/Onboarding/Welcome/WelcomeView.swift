//
//  WelcomeView.swift
//  
//
//  Created by Justin Honda on 2/7/22.
//

import SwiftUI

internal struct WelcomeView: View {
    
    // MARK: - Properties
    
    var page: Int { OnboardingState.welcome.rawValue }
    
    // MARK: - Body
    
    var body: some View {
        Text("Semper Fi! Welcome to MarineFit. We have a few questions to get started.")
    }
}

// MARK: - Previews

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
