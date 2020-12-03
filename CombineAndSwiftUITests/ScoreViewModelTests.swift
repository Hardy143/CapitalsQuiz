//
//  ScoreViewModelTests.swift
//  CombineAndSwiftUITests
//
//  Created by Vicki Larkin on 03/12/2020.
//

import XCTest
@testable import CombineAndSwiftUI

class ScoreViewModelTests: XCTestCase {
    
    let testCaptial = Capital(name: "Dublin", isChecked: true)
    let testCountry = Country(name: "Ireland", topLevelDomain: [], alpha2Code: "", alpha3Code: "", callingCodes: [], capital: "Dublin", altSpellings: [], region: .europe, subregion: "", population: 0, latlng: [], demonym: "", area: 2, gini: 2, timezones: [], borders: [], nativeName: "", numericCode: "", currencies: [], languages: [], translations: Translations(de: "", es: "", fr: "", ja: "", it: "", br: "", pt: "", nl: "", hr: "", fa: ""), flag: "", regionalBlocs: [], cioc: "")

    func testUpdateScore_finalScoreIs30() throws {
        // Given
        let sut = ScoreViewModel(score: 20)
        let expected = 30
        
        
        // When
        sut.updateScore(capital: testCaptial, country: testCountry)
        let actual = sut.finalScore
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    func testResetScore_finalScoreIs0() {
        // Given
        let sut = ScoreViewModel(score: 50)
        sut.updateScore(capital: testCaptial, country: testCountry)
        let expected = 0
    
        // When
        sut.resetScore()
        let actual = sut.finalScore
    
        // Then
        XCTAssertEqual(expected, actual)
    }


}
