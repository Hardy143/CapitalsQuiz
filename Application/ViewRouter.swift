//
//  ViewRouter.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 03/12/2020.
//

import Foundation

class GameStateController: ObservableObject {
    
    @Published private(set) var gameState: GameState = .active
    
    func changeGameState() {
        switch gameState {
        case .active:
            gameState = .inactive
        default:
            gameState = .active
        }
    }
}
