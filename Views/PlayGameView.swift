//
//  PlayGameView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 01/12/2020.
//

import SwiftUI

struct PlayGameView: View {
    
    @State private var isShowingDetailView = false
    @ObservedObject var viewRouter = GameStateController()
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: GameView(viewRouter: viewRouter)) {
                Text("Play Game")
                    .navigationBarHidden(true)
            }
            
        }
        
    }
}

struct PlayGameView_Previews: PreviewProvider {
    static var previews: some View {
        PlayGameView()
    }
}
