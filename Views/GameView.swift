//
//  GameView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 16/11/2020.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var countryViewModel: CountryViewModel
    @ObservedObject var scoreViewModel: ScoreViewModel
    @ObservedObject var counterViewModel: CounterViewModel
    
    var body: some View {
        Text(self.countryViewModel.country?.name ?? "")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
        
        VStack {
            List(countryViewModel.capitals) { capital in
                CapitalRow(capital: capital, countryViewModel: countryViewModel, scoreViewModel: scoreViewModel, counterViewModel: counterViewModel)
            }
            .listStyle(InsetListStyle())
            
            Text("10")
                .font(.custom("Counter", size: 80))
                .fontWeight(.bold)
                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(countryViewModel: CountryViewModel(), scoreViewModel: ScoreViewModel(), counterViewModel: CounterViewModel())
    }
}
