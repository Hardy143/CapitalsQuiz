//
//  GameView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 16/11/2020.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var countryViewModel: CountryViewModel
    @ObservedObject var counterViewModel: CounterViewModel
    
    var body: some View {
        Text(self.countryViewModel.country?.name ?? "")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
        
        VStack {
            List(countryViewModel.capitals) { capital in
                CapitalRow(capital: capital, countryViewModel: countryViewModel, counterViewModel: counterViewModel)
            }
            .listStyle(InsetListStyle())
            
            TimerView()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(countryViewModel: CountryViewModel(), counterViewModel: CounterViewModel())
    }
}
