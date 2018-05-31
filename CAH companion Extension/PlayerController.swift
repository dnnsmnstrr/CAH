//
//  PlayerController.swift
//  CAH companion Extension
//
//  Created by Dennis Muensterer on 18.01.18.
//  Copyright © 2018 Dennis Muensterer. All rights reserved.
//

import WatchKit
import Foundation


class PlayerController: WKInterfaceController {
    @IBOutlet var playerPicker: WKInterfacePicker!
    
    @IBOutlet var cardControl: WKInterfaceLabel!
    @IBAction func moreCards() {
        if CardsAgainst.amountOfCards < CardsAgainst.maxAmountOfCards{
            CardsAgainst.amountOfCards += 1
            cardControl.setText("Cards " + String(CardsAgainst.amountOfCards))
        }
    }
    @IBAction func fewerCards() {
        if CardsAgainst.amountOfCards > 2 {
            CardsAgainst.amountOfCards -= 1
            cardControl.setText("Cards " + String(CardsAgainst.amountOfCards))
        }
    }
    
    @IBAction func setToDefault(_ sender: Any) {
        CardsAgainst.amountOfCards = CardsAgainst.defaultAmountOfCards
        cardControl.setText("Cards " + String(CardsAgainst.amountOfCards))
    }
    
    
    
    @IBAction func onCountChanged(_ value: Int) {
        
        CardsAgainst.playerCount = value+3
        print(CardsAgainst.playerCount)
    }
    
    @IBAction func returnButton() {
        
        print(CardsAgainst.gameArray, CardsAgainst.currentPlayer, CardsAgainst.currentCard, CardsAgainst.endGameMode)
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        CardsAgainst.amountOfCards = CardsAgainst.defaultAmountOfCards
        cardControl.setText("Cards " + String(CardsAgainst.amountOfCards))
        
        var playerCountItems: [WKPickerItem] = []
        for i in 3...CardsAgainst.maxPlayerCount {
            let item = WKPickerItem()
            item.title = String(i)
            playerCountItems.append(item)
        }
        playerPicker.setItems(playerCountItems)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
