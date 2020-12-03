//
//  CountryView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 03/12/2020.
//

import SwiftUI

struct CountryView: View {
    
    @ObservedObject var countryViewModel: CountryViewModel
    
    var body: some View {
        Text(self.countryViewModel.country?.name ?? "")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(countryViewModel: CountryViewModel())
    }
}

