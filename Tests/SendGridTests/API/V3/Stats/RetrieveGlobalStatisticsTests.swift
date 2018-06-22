//
//  RetrieveGlobalStatisticsTests.swift
//  SendGridTests
//
//  Created by Scott Kawai on 9/20/17.
//

import XCTest
@testable import SendGrid

class RetrieveGlobalStatisticsTests: XCTestCase {
    
    func date(day: Int) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: "2017-09-\(day)")!
    }
    
    func testMinimalInitialization() {
        let request = RetrieveGlobalStatistics(startDate: date(day: 20))
        XCTAssertEqual(request.description, "")
    }
    
    func testMaxInitialization() {
        let request = RetrieveGlobalStatistics(startDate: date(day: 20), endDate: date(day: 27), aggregatedBy: .week)
        XCTAssertEqual(request.description, "")
    }
    
    func testValidation() {
        let good = RetrieveGlobalStatistics(startDate: date(day: 20), endDate: date(day: 27), aggregatedBy: .week)
        XCTAssertNoThrow(try good.validate())
        
        do {
            let request = RetrieveGlobalStatistics(startDate: date(day: 20), endDate: date(day: 19))
            try request.validate()
            XCTFail("Expected a failure to be thrown when the end date is before the start date, but nothing was thrown.")
        } catch SendGrid.Exception.Statistic.invalidEndDate {
            XCTAssertTrue(true)
        } catch {
            XCTFailUnknownError(error)
        }
    }
    
}