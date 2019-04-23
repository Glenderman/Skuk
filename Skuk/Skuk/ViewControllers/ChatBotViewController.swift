//
//  ChatBotViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 23/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit
import ApiAI
import AVFoundation

class ChatBotViewController: UIViewController {
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    @IBOutlet var messageLbl: UILabel!
    @IBOutlet var messageTextField: UITextField!
    
    @IBAction func sendMessageBtn(_ sender: Any) {
        let request = ApiAI.shared().textRequest()
        
        if let text = self.messageTextField.text, text != "" {
            request?.query = text
        } else {
            return
        }
        
        request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                self.speechAndText(text: textResponse)
            }
        }, failure: { (request, error) in
            print(error!)
        })
        
        ApiAI.shared().enqueue(request)
        messageTextField.text = ""
    }
    
    func speechAndText(text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.messageLbl.text = text
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
