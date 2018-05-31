//
//  BlackCardView.swift
//  CAH
//
//  Created by Dennis Muensterer on 17.01.18.
//  Copyright © 2018 Dennis Muensterer. All rights reserved.
//

import UIKit

class BlackCardView: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var blackCardText: UITextView!
    @IBOutlet weak var drawCard: UIButton!
    @IBAction func newCard(_ sender: Any) {
        randomCard()
    }

    func randomCard(){
        blackCardText.text = Cards.blackCards[Int(arc4random_uniform(UInt32(Cards.blackCards.count)))]
    }

    override func viewDidLoad() { 
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
