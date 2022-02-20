import SwiftUI

internal enum PFTEventCategory: String {
    case cardio
    case upperbody
    case core
    
    init?(rawValue: String) {
        switch rawValue {
            case "upperbody", "Upperbody", "UpperBody":
                self = .upperbody
            case "cardio", "Cardio":
                self = .cardio
            case "core", "Core", "CoreStrength", "corestrength":
                self = .core
            default: return nil
        }
    }
    
    func mapToColor() -> Color {
        switch self {
            case .cardio: return .green
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
    
    internal let categoryName: String
    internal let eventName: String
    internal let eventScore: String
    internal let pftScore: Int
    
    internal var category: PFTEventCategory? {
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
    internal let date: String
    internal let events: [PFTEventDataModelAdapter]
    
    internal var totalScore: Int {
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
