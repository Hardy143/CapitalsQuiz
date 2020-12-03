//
//  TimerView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 26/11/2020.
//

import SwiftUI

struct TimerView: View {

    @EnvironmentObject var countryViewModel: CountryViewModel
    @EnvironmentObject var gameStateController: GameStateController
        
    var body: some View {
        Text("10")
            .font(.custom("Counter", size: 80))
            .fontWeight(.bold)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 50, trailing: 10))

    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
