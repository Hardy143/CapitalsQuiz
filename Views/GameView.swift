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
                CountryView(countryViewModel: countryViewModel)
                
                List(countryViewModel.capitals) { capital in
                    CapitalRow(capital: capital, countryViewModel: countryViewModel)
                }
                .listStyle(InsetListStyle())
                
                TimerView()
                
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
