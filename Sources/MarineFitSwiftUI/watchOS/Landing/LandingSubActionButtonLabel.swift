//
//  LandingSubActionView.swift
//  MarineFit WatchKit Extension
//
//  Created by Justin Honda on 1/29/22.
//

import SwiftUI

public struct LandingSubActionButtonLabel: View {
    
    // MARK: - Properties
    
    private let systemImageName: String
    
    // MARK: - Public Init
    
    public init(systemImageName: String) {
        self.systemImageName = systemImageName
    }
    
    // MARK: - Body
    
    public var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .foregroundColor(Color.MarineCorps.red)
    }
}

// MARK: - Previews

struct LandingSubActionView_Previews: PreviewProvider {
    static var previews: some View {
        LandingSubActionButtonLabel(systemImageName: "gear")
    }
}
