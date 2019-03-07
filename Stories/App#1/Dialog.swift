//
//  Dialog.swift
//  App#1
//
//  Created by Kushagra Gupta on 11/10/18.
//  Copyright © 2018 Kushagra Gupta. All rights reserved.
//

import Foundation

class Dialog {
    let dialog : String
    let text1 : String
    let text2 : String
    let option1 : Int
    let option2 : Int
    
    init(text:String,opt1:String,opt2:String,op1:Int,op2:Int) {
        dialog = text
        text1 = opt1
        text2 = opt2
        option1 = op1
        option2 = op2
    }
}
