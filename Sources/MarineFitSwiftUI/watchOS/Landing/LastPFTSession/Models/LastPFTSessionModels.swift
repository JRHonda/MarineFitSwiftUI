import SwiftUI

public enum PFTEventCategory: String {
    case endurance
    case upperbody
    case core
    
    public init?(rawValue: String) {
        switch rawValue {
            case "endurance", "Endurance":
                self = .endurance
            case "upperbody", "Upperbody", "UpperBody":
                self = .upperbody
            case "core", "Core", "CoreStrength", "corestrength":
                self = .core
            default: return nil
        }
    }
    
    public func mapToColor() -> Color {
        switch self {
            case .endurance: return .green
            case .upperbody: return .red
            case .core: return .blue
        }
    }
}

/// Data model for a PFT event
public struct PFTEventDataModelAdapter: Comparable {
    public static func < (lhs: PFTEventDataModelAdapter, rhs: PFTEventDataModelAdapter) -> Bool {
        lhs.pftScore > rhs.pftScore
    }
    
    public let categoryName: String
    public let eventName: String
    public let eventScore: String
    public let pftScore: Int
    
    public var category: PFTEventCategory? {
        .init(rawValue: categoryName)
    }
    
    public init(categoryName: String, eventName: String, eventScore: String, pftScore: Int) {
        self.categoryName = categoryName
        self.eventName = eventName
        self.eventScore = eventScore
        self.pftScore = pftScore
    }
}

/// Data model for a PFT session
public struct PFTSessionDataModelAdapter {
    public let date: String
    public let events: [PFTEventDataModelAdapter]
    
    public var totalScore: Int {
        events.compactMap { $0.pftScore }.reduce(0, +)
    }
    
    public init(date: String, events: [PFTEventDataModelAdapter]) {
        self.date = date
        self.events = events
    }
}


// MARK: - Internal Prototyping Data Models

internal let lastPFTSession_Internal = PFTSessionDataModelAdapter(date: "Feb 17, 2022",
                                                                  events: pftEvents_Internal)

internal let pftEvents_Internal: [PFTEventDataModelAdapter] = [
    .init(categoryName: "Cardio", eventName: "Run", eventScore: "18:12", pftScore: 98),
    .init(categoryName: "Upperbody", eventName: "Pullups", eventScore: "10", pftScore: 50),
    .init(categoryName: "CoreStrength", eventName: "Crunches", eventScore: "67", pftScore: 67)
]
