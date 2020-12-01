//
//  GameView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 16/11/2020.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var countryViewModel = CountryViewModel()
    @EnvironmentObject var counterViewModel: CounterViewModel
    @EnvironmentObject var scoreViewModel: ScoreViewModel
    @State private var showScoreView = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text(self.countryViewModel.country?.name ?? "")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                List(countryViewModel.capitals) { capital in
                    CapitalRow(capital: capital, countryViewModel: countryViewModel)
                }
                .listStyle(InsetListStyle())
                
            }
            
        }
        .navigationBarBackButtonHidden(true)


    }

}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
