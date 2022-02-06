//
//  LandingView.swift
//  MarineFit WatchKit Extension
//
//  Created by Justin Honda on 1/29/22.
//

import SwiftUI

/// ** Internal Prototype only - not for use in production code **
internal struct LandingView: View {
    
    let width: CGFloat
    @State private var isForceAltitudeOn: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Button {
                print("start PFT session")
            } label: {
                PFTStartButtonLabel(text: "START", diameter: width, shape: Circle(), fill: .clear)
            }.buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            HStack(spacing: 32) {
                let width: CGFloat = 25
                
                SettingsButton($isForceAltitudeOn)
                    .diameter(width)
                
                Button {
                    print("open last PFT session")
                } label: {
                    LandingSubActionButtonLabel(systemImageName: "heart.text.square")
                }.frame(width: width, height: width)
                
                Button {
                    print("open app information")
                } label: {
                    LandingSubActionButtonLabel(systemImageName: "info.circle")
                }.frame(width: width, height: width)
                
            }.buttonStyle(PlainButtonStyle())
        }
        .padding()
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // preview takes on scheme selection
            GeometryReader { proxy in
                LandingView(width: proxy.size.width / 1.5)
                    .frame(width: proxy.size.width,
                           height: proxy.size.height)
            }
            
            /** subsequent preview devices can be added manually */
            
            GeometryReader { proxy in
                LandingView(width: proxy.size.width / 1.5)
                    .frame(width: proxy.size.width,
                           height: proxy.size.height)
            }.previewDevice("Apple Watch Series 5 - 40mm")
        }
        .ignoresSafeArea()
    }
}
