//
//  WelcomeView.swift
//  
//
//  Created by Justin Honda on 2/7/22.
//

import SwiftUI

public struct WelcomeView: View {
    
    // MARK: - Properties
    
    public var page: Int { 1 }
    
    // MARK: - Public Init
    
    public init() { }
    
    // MARK: - Body
    
    public var body: some View {
        Text("Semper Fi! Welcome to MarineFit. We have a few questions to get started.")
    }
}

// MARK: - Previews

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
