//
//  LandingSubActionView.swift
//  MarineFit WatchKit Extension
//
//  Created by Justin Honda on 1/29/22.
//

import SwiftUI

public struct LandingSubActionButtonLabel: View {
    
    private let systemImageName: String
    
    public init(systemImageName: String) {
        self.systemImageName = systemImageName
    }
    
    public var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .foregroundColor(Color.MarineCorps.red)
    }
    
}

struct LandingSubActionView_Previews: PreviewProvider {
    static var previews: some View {
        LandingSubActionButtonLabel(systemImageName: "gear")
    }
}
