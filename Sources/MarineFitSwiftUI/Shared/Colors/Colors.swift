//
//  Colors.swift
//  
//
//  Created by Justin Honda on 2/4/22.
//

#if !os(macOS)
import UIKit
#else
import AppKit
#endif
import SwiftUI

public extension Color {
    enum MarineCorps {
        public static let yellow = Color(.init(srgbRed: 240/255, green: 211/255, blue: 93/255, alpha: 1))
        public static let red = Color(.init(srgbRed: 231/255, green: 60/255, blue: 48/255, alpha: 1))
    }
}

