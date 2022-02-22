//
//  PFTSessionEventScoreButton.swift
//  
//
//  Created by Justin Honda on 2/20/22.
//

import SwiftUI

internal struct PFTSessionEventScoreButton: View {
    
    // MARK: - Properties
    
    internal let event: PFTEventDataModelAdapter
    
    // MARK: - Body
    
    var body: some View {
//        Button {
//            // TODO: - Support showing workout completed
//        } label: {
            ZStack {
                Color
                    .black
                    .contentShapedOverlay(Capsule(),
                                    .clear,
                                    strokeBorder: Color.MarineCorps.red,
                                    lineWidth: 1)
                
                Text("\(event.pftScore)")
                    .foregroundColor(event.category?.mapToColor() ?? .red)
            }
       // }.buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Previews

internal struct PFTSessionEventScoreButton_Previews: PreviewProvider {
    static var previews: some View {
        PFTSessionEventScoreButton(event: .init(categoryName: "Cardio", eventName: "Running", eventScore: "20:00", pftScore: 88))
    }
}
