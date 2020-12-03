//
//  GameView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 16/11/2020.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var countryViewModel = CountryViewModel()
    @EnvironmentObject var gameStateController: GameStateController
    @EnvironmentObject var scoreViewModel: ScoreViewModel
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center, spacing: 20) {
                CountryView(countryViewModel: countryViewModel)
                
                List(countryViewModel.capitals) { capital in
                    CapitalRow(capital: capital, countryViewModel: countryViewModel)
                }
                .listStyle(InsetListStyle())
                
                TimerView()
                
            }
            
        }
        
        NavigationLink(
            destination: ScoreView(countryViewModel: countryViewModel),
            isActive: $gameStateController.isGameFinished) {
            
        }
        .navigationBarBackButtonHidden(true)


    }

}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
