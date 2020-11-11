//
//  CountryViewModel.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 11/11/2020.
//

import Foundation
import Combine

class CountryViewModel: ObservableObject {
    @Published var capital: String = ""
    var subscriptions: Set<AnyCancellable> = []
    let networkManager = NetworkManager()
    
    init () {
        let result = networkManager.retrieveDataWithCombine()
        let _ = result.sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { country in
            self.capital = country.first?.capital ?? "hasn't worked"
            
        })
        .store(in: &subscriptions)
    }
}
