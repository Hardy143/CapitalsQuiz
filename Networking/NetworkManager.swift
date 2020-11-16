//
//  NetworkManager.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 11/11/2020.
//

import Foundation
import Combine

class NetworkManager {
    
    static func retrieveDataWithCombine() -> AnyPublisher<[Country], CountryError> {
        let url = Urls.allCountries
        
        return URLSession.shared.dataTaskPublisher(for: url)
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
}
