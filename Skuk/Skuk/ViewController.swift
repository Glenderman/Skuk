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

    @objc func nextVC() {
        self.performSegue(withIdentifier: "toLogin", sender: self)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.splashAnimation()
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(nextVC), userInfo: nil, repeats: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func splashAnimation() {
        let appName = "Skük"
        
        for char in appName {
            skukLbl.text! += "\(char)"
            RunLoop.current.run(until: Date()+0.4)
        }
    }
}

