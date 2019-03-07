//
//  ViewController.swift
//  App#1
//
//  Created by Kushagra Gupta on 02/10/18.
//  Copyright © 2018 Kushagra Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var storyText: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    
    var dialogNum = 0
    let dB = dialogBank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyText.text = dB.list[dialogNum].dialog
        button1.setTitle(dB.list[dialogNum].text1, for: [])
        button2.setTitle(dB.list[dialogNum].text2, for: [])
        
        
        
        
    }
    @IBAction func optionPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            dialogNum = dB.list[dialogNum].option1
            nextDialog()
        }
        else if sender.tag == 1 {
            dialogNum = dB.list[dialogNum].option2
            nextDialog()
        }
    }
    
    func nextDialog() {
        storyText.text = dB.list[dialogNum].dialog
        button1.setTitle(dB.list[dialogNum].text1, for: [])
        button2.setTitle(dB.list[dialogNum].text2, for: [])
    }
    
    
    
    
    
}

