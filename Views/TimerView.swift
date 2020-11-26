//
//  TimerView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 26/11/2020.
//

import SwiftUI

struct TimerView: View {
    
    @ObservedObject var timerViewModel: TimerViewModel = TimerViewModel()
    
    var body: some View {
        Text("\(timerViewModel.timer)")
            .font(.custom("Counter", size: 80))
            .fontWeight(.bold)
            .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
