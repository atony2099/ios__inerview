//
//  ViewController.swift
//  01-PresentionLayer
//
//  Created by admin on 05/03/2018.
//  Copyright © 2018 atony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            }
    
    
    @IBAction func changeAlpha(_ sender: UIButton) {
        
       let targetAlpha:CGFloat = 0.0;
       let timer =  Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
        print("presentLayer is:",sender.layer.presentation()!.opacity,"modelaLayeris :", sender.layer.model().opacity,"layer is:", sender.layer.opacity)
        }

        UIView.animate(withDuration: 3, animations: {
            sender.alpha = targetAlpha;
        }) { _ in
            timer.invalidate()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

