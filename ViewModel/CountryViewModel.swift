//
//  CountryViewModel.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 11/11/2020.
//

import Foundation
import Combine

class CountryViewModel: ObservableObject {
    @Published private(set) var country: Country?
    @Published private(set) var capitals: [Capital] = []
    
    private let networkManager: NetworkManager
    private var allCountries: Countries = []
    private var subscriptions: Set<AnyCancellable> = []
    
    var delegate: Callback?
    
    init (networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
        self.retrieveCountryData()
    }
    
    func nextQuestion() {
        capitals = []
        setUpQuestion()
    }
}

// Mark: Private Functions

extension CountryViewModel {
    
    private func retrieveCountryData() {
        let countries = networkManager.retrieveDataWithCombine()
            .receive(on: DispatchQueue.main)
        
        countries
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                self.delegate?.onDone()
                break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { countries in
            self.allCountries = countries.filter { $0.capital != "" }
            self.setUpQuestion()
            
        })
        .store(in: &subscriptions)
    }
    
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
