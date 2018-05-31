//
//  InterfaceController.swift
//  CAH companion Extension
//
//  Created by Dennis Muensterer on 17.01.18.
//  Copyright © 2018 Dennis Muensterer. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var blackCardLabel: WKInterfaceLabel!
    @IBOutlet var whiteCardButton: WKInterfaceButton!
    @IBOutlet var whiteCardLabel: WKInterfaceLabel!
    @IBOutlet var spacer: WKInterfaceGroup!
    
    @IBAction func changeBlackCard() {

        self.scroll(to: self.blackCardLabel, at: WKInterfaceScrollPosition.top, animated: true)

        animate(withDuration: 0.2){
            self.blackCardLabel.setAlpha(0)
        }
        
        let delayTime = DispatchTime.now() +
            Double(Int64(0.3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.spacer.setHeight(200)
            self.changeLabelText(string: Cards.blackCards[Int(arc4random_uniform(UInt32(Cards.blackCards.count)))], label: self.blackCardLabel, fontSize: 24)
            self.blackCardLabel.setAlpha(1)
            self.animate(withDuration:0.6) {
            self.spacer.setHeight(0)
            }
        }
    }
    
    @IBAction func doubleTapGesture(_ sender: Any) {
        changeBlackCard()
        self.scroll(to: self.blackCardLabel, at: WKInterfaceScrollPosition.top, animated: true)

    }
    @IBAction func fillerButton(_ sender: Any) {
        changeBlackCard()
        self.scroll(to: self.blackCardLabel, at: WKInterfaceScrollPosition.top, animated: true)
    }
    
    @IBAction func installExpansionPack() {
        Cards.blackCards.append(contentsOf: Cards.blackCardExpansions)
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        WKExtension.shared().isAutorotating = true
        
        changeLabelText(string: Cards.blackCards[Int(arc4random_uniform(UInt32(Cards.blackCards.count)))], label: blackCardLabel, fontSize: 22)
        changeLabelText(string: " New Card!", label: whiteCardLabel, fontSize: 20)
        
    }
    
    func changeLabelText(string: String, label: WKInterfaceLabel, fontSize: CGFloat) {
        let attributedText = NSAttributedString(
            string: string,
            attributes: NSDictionary(object: UIFont(name: "Helvetica-Bold", size: fontSize)!, forKey: NSAttributedStringKey.font as NSCopying) as? [NSAttributedStringKey : Any])
        label.setAttributedText(attributedText)
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
