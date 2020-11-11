//
//  NetworkManager.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 11/11/2020.
//

import Foundation
import Combine

class NetworkManager {
    
    func retrieveDataWithURLSession() {
        guard let url = URL(string: "https://restcountries.eu/rest/v2/name/ireland?fullText=true") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
           if let data = data {
               do {
                 let country = try JSONDecoder().decode([Country].self, from: data)
                 print(country[0].capital)
               } catch let error {
                  print(error)
               }
            }
        }.resume()
    }
    
    func retrieveDataWithCombine() -> AnyPublisher<[Country], CountryError> {
        let url = URL(string: "https://restcountries.eu/rest/v2/name/ireland?fullText=true")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { response -> Data in
                guard let httpURLResponse = response.response as? HTTPURLResponse,
                      httpURLResponse.statusCode == 200
                else {
                    throw CountryError.statusCode
                }
                return response.data
            }
            .decode(type: [Country].self, decoder: JSONDecoder())
            .mapError { CountryError.map($0) }
            .eraseToAnyPublisher()
        
    }
    
}
