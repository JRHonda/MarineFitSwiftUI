//
//  SettingsProvider.swift
//  
//
//  Created by Justin Honda on 2/6/22.
//

import Foundation

public protocol SettingsProvider: ObservableObject {
    /// Allows user to force altitude settings which are used to calculate their
    /// PFT score differently.
    var isForceAltitudeOn: Bool { get set }
}

/// Used for internal prototyping
internal class SettingsProviderImpl_Internal: SettingsProvider {
    @Published var isForceAltitudeOn: Bool = false
}
