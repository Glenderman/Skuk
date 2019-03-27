//
//  ButtonAnimation.swift
//  Skuk
//
//  Created by Glen Griffiths on 20/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func touchesBegan() {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
