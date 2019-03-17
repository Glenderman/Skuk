//
//  ViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 17/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var skukLbl: UILabel!
    @IBOutlet var scanCookLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.splashAnimation()
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(nextVC), userInfo: nil, repeats: false)
    }
    
    @objc func nextVC() {
        self.performSegue(withIdentifier: "toLogin", sender: self) //function to segue to next screen
    }
    
    func splashAnimation() { //function which animates the text coming in for the splash screen
        
        skukLbl.text = ""
        scanCookLbl.text = ""
        
        let name = "Skük"
        let sublabel = "Scan and Cook"
        
        for skuk in name {
            skukLbl.text! += "\(skuk)"
            RunLoop.current.run(until: Date()+0.4)
        }
        
        for skukSub in sublabel {
            scanCookLbl.text! += "\(skukSub)"
            RunLoop.current.run(until: Date()+0.05)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

