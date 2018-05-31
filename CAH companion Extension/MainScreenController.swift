//
//  MainScreenController.swift
//  CAH companion Extension
//
//  Created by Dennis Muensterer on 18.01.18.
//  Copyright © 2018 Dennis Muensterer. All rights reserved.
//

import WatchKit
import Foundation


class MainScreenController: WKInterfaceController {

    @IBAction func startNewGame() {
//        CardsAgainst.playerCount = 3
//        CardsAgainst.gameArray = []
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
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
