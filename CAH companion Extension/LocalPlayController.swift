//
//  LocalPlayController.swift
//  CAH companion Extension
//
//  Created by Dennis Muensterer on 18.01.18.
//  Copyright © 2018 Dennis Muensterer. All rights reserved.
//

import WatchKit
import Foundation


class LocalPlayController: WKInterfaceController {
    
//Outlets
    @IBOutlet var blackCardLabel: WKInterfaceLabel!

    @IBOutlet var spacer: WKInterfaceGroup!
    @IBOutlet var cardPicker: WKInterfacePicker!
    
    @IBOutlet var selectCardLabel: WKInterfaceLabel!
    @IBOutlet var selectCardButton: WKInterfaceButton!
    
    @IBOutlet var playAgain: WKInterfaceButton!
    @IBOutlet var mainMenu: WKInterfaceButton!
    
    @IBAction func playAgainAction() {
        //reset play again button
        animate(withDuration: 0.2) {
            self.playAgain.setAlpha(0)
        }
    }
    
    
    @IBAction func onCardChanged(_ value: Int) {
        scroll(to: cardPicker, at: .top, animated: true)
        if CardsAgainst.currentPlayer < CardsAgainst.playerCount  {
            changeLabelText(string: CardsAgainst.randomCardSelection[value], label: selectCardLabel, fontSize: 20)
            CardsAgainst.currentCard = CardsAgainst.randomCardSelection[value]
        }
        if CardsAgainst.endGameMode == true {
            if value < CardsAgainst.gameArray.count{
                changeLabelText(string: CardsAgainst.gameArray[value], label: selectCardLabel, fontSize: 20)
                CardsAgainst.currentCard = CardsAgainst.gameArray[value]
            }
            print(CardsAgainst.currentCard)
        }
        
        
    }
    @IBAction func selectCard() {
        if CardsAgainst.pickerIsFocused == true {
            cardPicker.focus()
            if CardsAgainst.currentCard == ""{
                
            }
            
            if CardsAgainst.endGameMode == true {
                cardPicker.focus()
                changeLabelText(string: "The winner is: " + CardsAgainst.currentCard, label: selectCardLabel, fontSize: 20)
                animate(withDuration: 0.2){
                    self.playAgain.setAlpha(1)
                    self.mainMenu.setAlpha(1)
                    self.spacer.setHeight(50)
                }
                scroll(to: selectCardButton, at: .top, animated: true)
            }
            if CardsAgainst.currentCard != "" && CardsAgainst.endGameMode == false{ //avoid untouched card (Crown not turned)
                
                CardsAgainst.gameArray.append(CardsAgainst.currentCard) //store player selection
                print(CardsAgainst.gameArray)
                
                
                changeLabelText(string: "Next Player.", label: selectCardLabel, fontSize: 20)
                cardPicker.resignFocus()
                CardsAgainst.pickerIsFocused = false
                
                CardsAgainst.currentCard = "" //reset card to untouched state
                
                //handle player turns
                if CardsAgainst.currentPlayer < CardsAgainst.playerCount  {
                    CardsAgainst.currentPlayer += 1
                    print(CardsAgainst.currentPlayer)
                }
                
                //Card Czar Time!
                if CardsAgainst.currentPlayer == CardsAgainst.playerCount {
                    changeLabelText(string: "Card Czar! Select your favorite card.", label: selectCardLabel, fontSize: 20)
                    
                    //"randomize array"
                        CardsAgainst.gameArray = CardsAgainst.gameArray.sorted {
                            $0.count > $1.count
                        }
                    
                    var cardItems: [WKPickerItem] = []
                    
                    
                    for card in CardsAgainst.gameArray {
                        let item = WKPickerItem()
                        item.title = String(card)
                        item.caption = "Choose Winner"
                        cardItems.append(item)
                    }
                    cardPicker.setItems(cardItems)
                    
                    CardsAgainst.endGameMode = true
                    
                }
                
                randomCards(amountOfCards: CardsAgainst.amountOfCards) //draw new set of cards
                
                //picker
                var cardItems: [WKPickerItem] = []
                for card in CardsAgainst.randomCardSelection {
                    let item = WKPickerItem()
                    item.title = String(card)
                    item.caption = "Player " + String(CardsAgainst.currentPlayer)
                    cardItems.append(item)
                }
                cardPicker.setItems(cardItems)
                
            }
        }
        else{ //move into view if unfocused
            scroll(to: cardPicker, at: .top, animated: true)
            cardPicker.focus()
            if CardsAgainst.pickerHasBeenFocused == false {
                changeLabelText(string: "(Spin crown to dial in your choice.)", label: selectCardLabel, fontSize: 20)
                CardsAgainst.pickerHasBeenFocused = true
            }

            CardsAgainst.pickerIsFocused = true
        }
        

        
    }
    
//awake
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        WKExtension.shared().isAutorotating = true
        self.spacer.setHeight(0)
        self.playAgain.setAlpha(0)
        self.mainMenu.setAlpha(0)
        CardsAgainst.gameArray = []
        CardsAgainst.currentPlayer = 1
        CardsAgainst.currentCard = ""
        CardsAgainst.endGameMode = false
        
        changeLabelText(string: "Tap to select card.", label: selectCardLabel, fontSize: 20)
        
        changeLabelText(string: Cards.blackCards[Int(arc4random_uniform(UInt32(Cards.blackCards.count)))], label: blackCardLabel, fontSize: 20) //generate random black card
        print(blackCardLabel)

        
        randomCards(amountOfCards: CardsAgainst.amountOfCards)
        print(CardsAgainst.randomCardSelection)

        
        var cardItems: [WKPickerItem] = []
        for card in CardsAgainst.randomCardSelection {
            let item = WKPickerItem()
            item.title = String(card)
            item.caption = "Player 1"
            cardItems.append(item)
        }
        cardPicker.setItems(cardItems)
    }
//end of awake
    
    
    
//functions
    
    //change passed label to given string in Helvetica-Bold and chosen font size
    func changeLabelText(string: String, label: WKInterfaceLabel, fontSize: CGFloat) {
        let attributedText = NSAttributedString(
            string: string,
            attributes: NSDictionary(object: UIFont(name: "Helvetica-Bold", size: fontSize)!, forKey: NSAttributedStringKey.font as NSCopying) as? [NSAttributedStringKey : Any])
        label.setAttributedText(attributedText)
        
    }
    

    func randomCards(amountOfCards: Int) {
        CardsAgainst.randomCardSelection = []
        for _ in 0...amountOfCards-1 {
            CardsAgainst.randomCardSelection.append(Cards.whiteCards[Int(arc4random_uniform(UInt32(Cards.whiteCards.count)))])
        }
    }
    
//    func randomizeArray(array: [String]) {
//
//        CardsAgainst.gameArray.sorted {
//            $0.count > $1.count
//        }
//
//
//        for card in 0...CardsAgainst.gameArray.count {
//            var rand = Int(arc4random_uniform(UInt32(CardsAgainst.gameArray.count-1)))
//            while CardsAgainst.randomizedArray[card] == CardsAgainst.gameArray[rand]{
//                rand = Int(arc4random_uniform(UInt32(CardsAgainst.gameArray.count-1)))
//
//            }
//            CardsAgainst.randomizedArray[card] = CardsAgainst.gameArray[rand]
//
//
//        }
//    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func pickerDidFocus(_ picker: WKInterfacePicker) {
        scroll(to: cardPicker, at: .top, animated: true)
        CardsAgainst.pickerIsFocused = true
    }
    
    override func pickerDidResignFocus(_ picker: WKInterfacePicker) {
        CardsAgainst.pickerIsFocused = false
        CardsAgainst.pickerHasBeenFocused = true
    }
    
}

extension LocalPlayController: WKCrownDelegate {
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?,
                        rotationalDelta: Double) {
        
    }
    
    func crownDidBecomeIdle(_ crownSequencer: WKCrownSequencer?) {
    }
}
