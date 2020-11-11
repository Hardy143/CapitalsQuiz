//
//  ContentView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 11/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var countryViewModel: CountryViewModel
    
    var body: some View {
        Text(self.countryViewModel.capital)
            .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(countryViewModel: CountryViewModel())
    }
}
