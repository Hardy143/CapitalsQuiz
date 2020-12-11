//
//  NetworkManager.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 11/11/2020.
//

import Foundation
import Combine

class NetworkManager {
    
    private let dataUrl: URL
    
    init(dataUrl: URL = Urls.allCountries) {
        self.dataUrl = dataUrl
    }
    
    func retrieveDataWithCombine() -> AnyPublisher<[Country], CountryError> {
        
        return URLSession.shared.dataTaskPublisher(for: dataUrl)
            .tryMap { response -> Data in
                guard let httpURLResponse = response.response as? HTTPURLResponse,
                      httpURLResponse.statusCode == 200
                else {
                    throw CountryError.statusCode
                }
                return response.data
            }
            .decode(type: Countries.self, decoder: JSONDecoder())
            .mapError { CountryError.map($0) }
            .eraseToAnyPublisher()
        
    }
    
}

struct Urls {
    static let allCountries = URL(string: "https://restcountries.eu/rest/v2/all")!
    static let mockUrl = URL(string: "https://api.mocki.io/v1/7eaf16f0")!
}
