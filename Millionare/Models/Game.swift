//
//  Game.swift
//  Millionare
//
//  Created by Sky on 25.10.2020.
//

import Foundation

final class Game {
    static let shared = Game()
    
    var gameSession: GameSession?
    private init() {}
    
}
