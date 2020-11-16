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
    @ObservedObject var scoreViewModel: ScoreViewModel
    @ObservedObject var counterViewModel: CounterViewModel
    
    var body: some View {
        HStack{
            Text(capital.name)
            Spacer()
            Text(capital.isChecked ? "✅" : "🔲")
        }
        .onTapGesture {
            self.capital.isChecked = true
            guard let country = countryViewModel.country else { return }
            
            if counterViewModel.count < 10 {
                scoreViewModel.updateScore(capital: capital, country: country)
                counterViewModel.updateCount()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.countryViewModel.nextQuestion()
                }
            } else {
                print("done")
            }
            
        }
        
        .padding(15)
    }
}

struct CapitalRow_Previews: PreviewProvider {
    static var previews: some View {
        CapitalRow(capital: Capital(name: "Dublin", isChecked: false), countryViewModel: CountryViewModel(), scoreViewModel: ScoreViewModel(), counterViewModel: CounterViewModel())
    }
}
