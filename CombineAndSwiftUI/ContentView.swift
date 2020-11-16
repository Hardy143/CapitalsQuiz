//
//  ContentView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 11/11/2020.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        GameView(countryViewModel: CountryViewModel(), scoreViewModel: ScoreViewModel(), counterViewModel: CounterViewModel())
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
