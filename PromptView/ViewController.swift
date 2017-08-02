//
//  ViewController.swift
//  PromptView
//
//  Created by TKang on 2017. 8. 2..
//  Copyright © 2017년 HisTools. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var durationTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard(_ gesture: UITapGestureRecognizer) {
        textView.resignFirstResponder()
        durationTextField.resignFirstResponder()
    }


    @IBAction func showPromptButtonTapped(_ sender: Any) {
        let text: String = textView.text ?? "some text"
        var duration: TimeInterval? = TimeInterval(durationTextField.text ?? "2")
        if duration == nil {
            duration = 2.0
        }
        
        
        PromptView.show(with: text, centerPoint: nil, textColor: nil, font: nil, backgroundColor: nil, maxAlpha: nil, duration: duration, presentingView: self.view) {
            
        }
    }
}

