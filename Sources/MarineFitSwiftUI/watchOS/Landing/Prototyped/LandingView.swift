//
//  LandingView.swift
//  MarineFit WatchKit Extension
//
//  Created by Justin Honda on 1/29/22.
//

import SwiftUI

/// ** Internal Prototype only - not for use in production code **
internal struct LandingView<Settings: SettingsProvider>: View {
    
    let width: CGFloat
    
    @State private var isForceAltitudeOn: Bool = false
    @State private var willReviewPFTSessionWhenComplete: Bool = false
    @StateObject fileprivate var settings = SettingsProviderImpl_Internal()
    let lastPFTSession = lastPFTSession_Internal
    
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
                
                SettingsButton<SettingsProviderImpl_Internal>()
                    .environmentObject(settings)
                    .diameter(width)
                
                DisplayLastPFTSessionButton(lastPFTSession: lastPFTSession, isSheetPresented: $willReviewPFTSessionWhenComplete)
                    .frame(width: width, height: width)
                
            }.buttonStyle(PlainButtonStyle())
        }.padding()
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // preview takes on scheme selection
            GeometryReader { proxy in
                LandingView<SettingsProviderImpl_Internal>(width: proxy.size.width / 1.5)
                    .frame(width: proxy.size.width,
                           height: proxy.size.height)
            }
            
            /** subsequent preview devices can be added manually */
            
            GeometryReader { proxy in
                LandingView<SettingsProviderImpl_Internal>(width: proxy.size.width / 1.5)
                    .frame(width: proxy.size.width,
                           height: proxy.size.height)
            }.previewDevice("Apple Watch Series 5 - 40mm")
        }
        .ignoresSafeArea()
    }
}
