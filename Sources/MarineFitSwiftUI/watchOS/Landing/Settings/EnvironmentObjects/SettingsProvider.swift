//
//  SettingsProvider.swift
//  
//
//  Created by Justin Honda on 2/6/22.
//

import Foundation

public protocol SettingsProvider: ObservableObject {
    var isForceAltitudeOn: Bool { get set }
}
