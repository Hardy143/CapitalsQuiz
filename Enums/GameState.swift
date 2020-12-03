//
//  GameState.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 01/12/2020.
//

import Foundation

enum GameState {
    case active
    case inactive

    var description: Bool {
        switch self {
        case .active:
            return true
        default:
            return false
        }
    }
}
