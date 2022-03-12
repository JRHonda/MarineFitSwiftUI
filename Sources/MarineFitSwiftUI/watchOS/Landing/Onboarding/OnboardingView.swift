//
//  OnboardingView.swift
//  
//
//  Created by Justin Honda on 2/7/22.
//

import SwiftUI

public enum OnboardingState: Int, CaseIterable {
    case welcome = 1
    case gender
    case dateOfBirth
    case name
}

/// View for ushering user through onboarding setup
public struct OnboardingView<Manager: OnboardingManagerProvider, Provider: OnboardingProfileProvider>: View {
    
    // MARK: - EnvironmentObject
    
    @EnvironmentObject var onboarding: Manager
    @EnvironmentObject var profile: Provider
    
    // MARK: - Binding
    
    @Binding var didTapSubmit: Bool
    
    // MARK: - Public Init
    
    public init(didTapSubmit: Binding<Bool>) {
        self._didTapSubmit = didTapSubmit
    }
    
    // MARK: - Body
    
    public var body: some View {
        GeometryReader { proxy in
            VStack {
                ScrollView {
                    switch onboarding.onboardingState {
                        case .welcome:
                            WelcomeView()
                                .multilineTextAlignment(.center)
                            
                        case .gender:
                            GenderSelectionView(genderSelected: $profile.gender)
                            
                        case .dateOfBirth:
                            DateOfBirthPickerView(dateSelected: $profile.dateOfBirth)
                                .frame(height: proxy.size.height / 2)
                            
                        case .name:
                            VStack(spacing: 8) {
                                InputNameView(input: $profile.name)
                                Text("Maybe later")
                                    .foregroundColor(.MarineCorps.red)
                                    .onTapGesture {
                                        profile.name = ""
                                        onboarding.willSkipAddingName = true
                                    }
                            }
                    }
                    
                }.padding()
                    
                // Next button
                Button {
                    if onboarding.onboardingState != .name {
                        onboarding.pageNumber += 1
                    } else {
                        didTapSubmit = true
                    }
                } label: {
                    ZStack {
                        Color
                            .clear
                            .contentShapedOverlay(Capsule(),
                                            .clear,
                                            strokeBorder: Color.MarineCorps.red,
                                            lineWidth: 2)
                        Text(onboarding.onboardingState == .name
                             ? "Submit"
                             : "Next")
                            .foregroundColor(.MarineCorps.red)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: proxy.size.width * 0.85, height: 40)
                .disabled(shouldNextButtonBeDisabled())
              
                // Custom paginated view
                HStack {
                    ForEach(1..<OnboardingState.allCases.count + 1, id: \.self) { page in
                        PageDotView(hasFinishedPage: onboarding.pageNumber >= page)
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 2)
            }
            .ignoresSafeArea(.container, edges: [.bottom])
        }
    }
    
    // MARK: - Private
    
    private func shouldNextButtonBeDisabled() -> Bool {
        switch onboarding.onboardingState {
            case .welcome:
                return false
            case .gender:
                return profile.gender == .none
            case .dateOfBirth:
                return false
            case .name:
                if onboarding.willSkipAddingName {
                    return false
                }
                return profile.name.isEmpty
        }
    }
}

// MARK: - Previews

struct OnboardingView_Previews: PreviewProvider {
    
    @StateObject static var onboarding = OnboardingManager(numberOfPages: OnboardingState.allCases.count)
    
    @StateObject static var profile = OnboardingProfile()
    
    @State static var didTapSubmit: Bool = false
    
    static var previews: some View {
        OnboardingView<OnboardingManager, OnboardingProfile>(didTapSubmit: $didTapSubmit)
            .environmentObject(onboarding)
            .environmentObject(profile)
            //.previewDevice("Apple Watch Series 6 - 40mm")
    }
}
