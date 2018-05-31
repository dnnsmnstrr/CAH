//
//  ViewController.swift
//  CAH
//
//  Created by Dennis Muensterer on 17.01.18.
//  Copyright © 2018 Dennis Muensterer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playCard: CardButtonWhite!
    
    @IBAction func slideOut(_ sender: Any) {
        let startingPos: CGPoint = playCard.frame.origin

        UIView.animate(withDuration: 0.5, animations: {self.playCard.frame.origin.y += 300}, completion: {finish in self.playCard.frame.origin = startingPos})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        if (navigationController?.topViewController != self) {
            navigationController?.navigationBar.isHidden = false
        }
        super.viewWillDisappear(animated)
    }
    

    
    
}

