//
//  ScoreView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 27/11/2020.
//

import SwiftUI

struct ScoreView: View {
    
    @EnvironmentObject var scoreViewModel: ScoreViewModel
    
    var body: some View {
        Text("Final Score: \(scoreViewModel.finalScore)")
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
