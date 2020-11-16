//
//  CountryViewModel.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 11/11/2020.
//

import Foundation
import Combine

class CountryViewModel: ObservableObject {
    @Published var country: Country?
    @Published var capitals: [Capital] = []
    
    private var allCountries: Countries = []
    var subscriptions: Set<AnyCancellable> = []
    
    init () {
        let countries = NetworkManager.retrieveDataWithCombine()
            .receive(on: DispatchQueue.main)
        
        countries
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { countries in
            self.allCountries = countries.filter { $0.capital != "" }
            self.setUpQuestion()
            
        })
        .store(in: &subscriptions)
    }
    
    func nextQuestion() {
        capitals = []
        setUpQuestion()
    }
}

// Mark: Private Functions

extension CountryViewModel {
    
    private func setUpQuestion() {
        let randomCountries = selectRandomCountries(countries: allCountries)
        
        // Test code
        for randomCountry in randomCountries {
            print("\(randomCountry.name): \(randomCountry.capital)")
        }
        print("...........")
        
        setUpCountry(randomCountries: randomCountries)
        setLabels(randomCountries: randomCountries)
    }
    
    private func selectRandomCountries(countries: Countries) -> Countries {
        let shuffledCountries = countries.shuffled()
        let selectedCountries = shuffledCountries.prefix(4)
        return Array(selectedCountries)
    }
    
    private func setUpCountry(randomCountries: Countries) {
        guard let correctAnswer = randomCountries.first else { return }
        self.country = correctAnswer
    }
    
    private func setLabels(randomCountries: Countries) {
        let shuffledCountries = randomCountries.shuffled()
        
        for country in shuffledCountries {
            let capital = Capital(name: country.capital, isChecked: false)
            self.capitals.append(capital)
        }
    }
    
}
