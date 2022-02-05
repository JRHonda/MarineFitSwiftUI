//
//  Font+extensions.swift
//  
//
//  Created by Justin Honda on 2/5/22.
//

import SwiftUI

public extension Font {
    static func mfDefaultSystem() -> Self {
        return system(size: 16, weight: .medium, design: .default)
    }
}
