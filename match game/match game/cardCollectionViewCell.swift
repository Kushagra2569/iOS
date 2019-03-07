//
//  cardCollectionViewCell.swift
//  match game
//
//  Created by Kushagra Gupta on 22/07/18.
//  Copyright © 2018 Kushagra Gupta. All rights reserved.
//

import UIKit

class cardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:card?
    
    func setCard(_ card:card) {
        self.card = card
        frontImageView.image = UIImage(named: card.imageName)
        
        if card.isMatched == true {
            frontImageView.alpha = 0
            backImageView.alpha = 0
            return
        }
        else {
            frontImageView.alpha = 1
            backImageView.alpha = 1
        }
        if card.isFlipped == true {
            UIImageView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
        }
        else {
            UIImageView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
        }
    }
    func flip(){
        UIImageView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
        
        
    }
    func flipBack() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) {
            UIImageView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.3, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
        }
        
        
    }
    func remove() {
        
        backImageView.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0
        }, completion: nil)
    }
}
