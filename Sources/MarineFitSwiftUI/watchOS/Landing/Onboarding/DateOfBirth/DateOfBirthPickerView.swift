//
//  DateOfBirthPickerView.swift
//  
//
//  Created by Justin Honda on 2/11/22.
//

import SwiftUI
import LagunaCalendar

internal struct DateOfBirthPickerView: View {
    
    // MARK: - Binding
    
    @Binding var dateSelected: Date
    
    // MARK: - Properties
    
    var page: Int { OnboardingState.dateOfBirth.rawValue }
    
    // MARK: - Private Propertires
    
    @StateObject private var observer = DatePickerManager()
    @State private var days: [Int] = []
    @State private var years: [Int] = []
    
    private let months = DaysInMonth.buildAbbreviatedMonthsList()
    private let numberOfDaysInMonth = DaysInMonth.buildNumberOfDaysPerMonthArray()
    
    // MARK: - Public Init
    
    public init(dateSelected: Binding<Date>) {
        self._dateSelected = dateSelected
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Text("Date of birth?")
            HStack {
                Picker(observer.month, selection: $observer.month) {
                    ForEach(months, id: \.self) {
                        Text("\($0)")
                    }
                }
                .onChange(of: observer.month) { newValue in
                    days = makeDayArray()
                    // TODO: - Refactor useages of this block
                    if let convertedDate = observer.convertToDate() {
                        dateSelected = convertedDate
                    }
                }
                
                Picker("Day", selection: $observer.day) {
                    ForEach(days, id: \.self) {
                        Text("\($0)")
                    }
                }
                .onChange(of: observer.day) { _ in
                    if let convertedDate = observer.convertToDate() {
                        dateSelected = convertedDate
                    }
                }
                
                Picker(String(observer.year), selection: $observer.year) {
                    ForEach(years.reversed(), id: \.self) { value in
                        Text(String(value).suffix(2))
                    }
                }
                .onChange(of: observer.year) { _ in
                    if let convertedDate = observer.convertToDate() {
                        dateSelected = convertedDate
                    }
                }
                
            }
            .onAppear(perform: {
                days = makeDayArray()
                years = makeYearArray()
                observer.year = years.last ?? Calendar.currentYear - CommonCalendarData.minimumMarineAge
                // start out Jan 1, XXXX, where XXXX is current year subtracted by minimum Marine age (17)
                if let latestDate = DateComponents(calendar: Calendar.autoupdatingCurrent, year: years.last, month: 1, day: 1).date {
                    dateSelected = latestDate
                }
                
            })
        }
    }
    
    // MARK: - Private Helpers
    
    private func makeDayArray() -> [Int] {
        guard let indexOfSelectedMonth = months.firstIndex(of: observer.month)
        else { return [] }

        let numberOfDaysInSelectedMonth = numberOfDaysInMonth[indexOfSelectedMonth]

        return (1...numberOfDaysInSelectedMonth).map { $0 }
    }
    
    private func makeYearArray() -> [Int] {
        let oneYearInSeconds: TimeInterval = 31536000
        let oneDayInSeconds: TimeInterval = 8640

        // current date
        let currentDate = Date.now

        // max date (17 years old)
        let numberOfLeapYearsIn17Years: TimeInterval = (17 / 4).rounded(.up)
        let leapYearsDaysOffSet: TimeInterval = numberOfLeapYearsIn17Years * oneDayInSeconds
        let inSeconds17Years: TimeInterval = oneYearInSeconds * 17
        let maxDate = currentDate.addingTimeInterval(-(inSeconds17Years + leapYearsDaysOffSet))

        // max date (62 years old)
        let numberOfLeapYearsIn45Years: TimeInterval = (45 / 4).rounded(.up)
        let minDateLeapYearOffset: TimeInterval = numberOfLeapYearsIn45Years * 86400
        let inSeconds45years: TimeInterval = oneYearInSeconds * 45
        let minDate = maxDate.addingTimeInterval(-(inSeconds45years + minDateLeapYearOffset))

        let maxYear = Calendar.autoupdatingCurrent.component(.year, from: maxDate)
        let minYear = Calendar.autoupdatingCurrent.component(.year, from: minDate)

        return (minYear...maxYear).map { $0 }
    }
}

// TODO: - Move to extension file
extension CommonCalendarData {
    static let minimumMarineAge: Int = 17
}

// MARK: - Previews

struct DateOfBirthPickerView_Previews: PreviewProvider {
    
    @State private static var dateSelected: Date = .now.addingTimeInterval(-80640)
    
    static var previews: some View {
        DateOfBirthPickerView(dateSelected: $dateSelected)
    }
}

protocol DateSelectionObserver: ObservableObject {
    var day: Int { get set }
    var month: String { get set }
    var year: Int { get set }
    
    func convertToDate() -> Date?
}

internal class DatePickerManager: DateSelectionObserver {
    @Published var day: Int = 1
    @Published var month: String = "Jan"
    @Published var year: Int = 0
    
    internal init() { }
    
    func convertToDate() -> Date? {
        return updateDateOfBirth()
    }
    
    private func updateDateOfBirth() -> Date? {
        let dateOfBirthFromPickerComponents = "\(month) \(day) \(year)"
        
        // TODO: - Expensive operation to create DateFormatter, need another approach
        let df = DateFormatter()
        df.dateFormat = "MMM dd yyyy"
        
        guard let updatedDateOfBirth = df.date(from: dateOfBirthFromPickerComponents)
        else { return nil }
        
        return updatedDateOfBirth
    }
    
}
