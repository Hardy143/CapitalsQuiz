//
//  CountryViewModelTests.swift
//  CombineAndSwiftUITests
//
//  Created by Vicki Larkin on 07/12/2020.
//

import XCTest
@testable import CombineAndSwiftUI

class CountryViewModelTests: XCTestCase, Callback {
    
    var sut: CountryViewModel!
    var mockNetworkManager: NetworkManager!
    var completionExpectation: XCTestExpectation?
    
    override func setUp() {
        mockNetworkManager = NetworkManager(dataUrl: Urls.mockUrl)
        sut = CountryViewModel(networkManager: mockNetworkManager)
        sut.delegate = self
    }
    
    override func tearDown() {
        mockNetworkManager = nil
        sut = nil
    }
    
    func onDone() {
        completionExpectation?.fulfill()
    }
    
    func testCountryViewModelInit_countryIsNotNil() {
        // Given
        completionExpectation = expectation(description: "countryNotNilExpectation")
        
        // Then
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(self.sut.country)
        
    }
        
    
    func testCountryViewModelInit_CapitalsCountIs4() {
        // Given
        let expected = 4
        completionExpectation = expectation(description: "capitalCountExpectation")
        
        // When
        waitForExpectations(timeout: 10, handler: nil)
        let actual = sut.capitals.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    func testNextQuestion_CountryNameIsDifferent() {
        // Given
        completionExpectation = expectation(description: "countryNameExpectation")
        waitForExpectations(timeout: 10, handler: nil)
        let expected = sut.country?.name
        
        // When
        sut.nextQuestion()
        let actual = sut.country?.name
        
        // Then
        XCTAssertNotEqual(expected, actual)
    }
    

}
