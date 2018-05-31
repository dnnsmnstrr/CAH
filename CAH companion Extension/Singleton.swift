//
//  File.swift
//  CAH companion Extension
//
//  Created by Dennis Muensterer on 18.01.18.
//  Copyright © 2018 Dennis Muensterer. All rights reserved.
//

import Foundation

final class CardsAgainst {
    
    static var amountOfCards = 0
    static let maxAmountOfCards = 99
    static let defaultAmountOfCards = 4

    static let maxPlayerCount = 16
    static var playerCount: Int = 3
    
    static var currentCard: String = ""
    static var currentPlayer: Int = 1
    static var roundsPlayed: Int = 0
    
    static var randomCardSelection: [String] = []
    static var gameArray: [String] = []
    static var winningCombos: [String] = []
    
    static var pickerIsFocused: Bool = false
    static var endGameMode: Bool = false
    static var pickerHasBeenFocused = false
    
}

