//
//  CapitalRow.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 16/11/2020.
//

import SwiftUI

struct CapitalRow: View {
    
    @State var capital: Capital
    @ObservedObject var countryViewModel: CountryViewModel
    @ObservedObject var timerViewModel: TimerViewModel
    @EnvironmentObject var scoreViewModel: ScoreViewModel
    @EnvironmentObject var gameStateController: GameStateController
    
    
    var body: some View {
        HStack{
            Text(capital.name)
            Spacer()
            Text(capital.isChecked ? "✅" : "🔲")
        }
        .onTapGesture {
            self.capital.isChecked = true
            guard let country = countryViewModel.country else { return }
            
            scoreViewModel.updateScore(capital: capital, country: country)
            gameStateController.updateCount()
            
            guard !gameStateController.isGameFinished else { return }
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.countryViewModel.nextQuestion()
                self.timerViewModel.startTimer()
            }
            
        }
        
        .padding(15)
        
    }
}

struct CapitalRow_Previews: PreviewProvider {
    static var previews: some View {
        CapitalRow(capital: Capital(name: "Dublin", isChecked: false), countryViewModel: CountryViewModel(), timerViewModel: TimerViewModel())
    }
}
