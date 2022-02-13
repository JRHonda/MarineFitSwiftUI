//
//  OnboardingManagerModel.swift
//  
//
//  Created by Justin Honda on 2/11/22.
//

import Foundation

public protocol OnboardingProfileProvider: ObservableObject {
    var gender: GenderSelection { get set }
    var dateOfBirth: Date { get set }
    var name: String { get set }
}

/// For internal previews
internal class OnboardingProfile: OnboardingProfileProvider {
    
    // MARK: - Published
    
    @Published var gender: GenderSelection = .none
    @Published var dateOfBirth: Date = .now
    @Published var name: String = ""
}

public protocol OnboardingManagerProvider: ObservableObject {
    var pageNumber: Int { get set }
    var willSkipAddingName: Bool { get set }
    var onboardingState: OnboardingState { get }
    var numberOfPages: Int { get }
}

/// For internal previews
internal class OnboardingManager: OnboardingManagerProvider {
    
    // MARK: - Published
    
    @Published var pageNumber: Int = 1
    @Published var willSkipAddingName: Bool = false
    
    // MARK: - Properties
    
    var onboardingState: OnboardingState {
        switch pageNumber {
            case 1: return .welcome
            case 2: return .gender
            case 3: return .dateOfBirth
            case 4: return .name
            default: return .name
        }
    }
    
    let numberOfPages: Int
    
    // MARK: - Public Init
    
    init(numberOfPages: Int) {
        self.numberOfPages = numberOfPages
    }
}
