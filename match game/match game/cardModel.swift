//
//  cardModel.swift
//  match game
//
//  Created by Kushagra Gupta on 21/07/18.
//  Copyright © 2018 Kushagra Gupta. All rights reserved.
//

import Foundation
class cardModel {
    func getCards() -> [card] {
        var generatedNumberArray = [Int]()
        var generateCardArray = [card]()
        while generatedNumberArray.count < 8 {
            //Generate Random NO
            let randomNo = arc4random_uniform(13) + 1
            
            if generatedNumberArray.contains(Int(randomNo)) == false {
                //log the result
                print(randomNo)
                generatedNumberArray.append(Int(randomNo))
                let cardOne = card()
                cardOne.imageName = "card\(randomNo)"
                generateCardArray.append(cardOne)
                let cardTwo = card()
                cardTwo.imageName = "card\(randomNo)"
                generateCardArray.append(cardTwo)
                
            }
            
        }
        
        for i in 0...generateCardArray.count-1 {
            let randomNumber = Int(arc4random_uniform(UInt32(generateCardArray.count)))
            let temp = generateCardArray[i]
            generateCardArray[i] = generateCardArray[randomNumber]
            generateCardArray[randomNumber] = temp
            
            
        }
       return generateCardArray
    }
    
    
}
