//
//  ViewController.swift
//  match game
//
//  Created by Kushagra Gupta on 20/07/18.
//  Copyright © 2018 Kushagra Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var model = cardModel()
    var cardArray = [card]()
    var firstFlippedCard:IndexPath?
    var timer:Timer?
    var milliseconds:Float = 50000

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cardArray =  model.getCards()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func timerElapsed(){
        milliseconds -= 1
        let seconds = String(format: "%.2f", milliseconds/1000)
        
        timerLabel.text = "Time Remaining:\(seconds)"
        
        if milliseconds <= 0{
            timer?.invalidate()
            timerLabel.textColor = UIColor.red
            checkGameEnded()
        }
        
    }
    // MARK: - UICollectionVIew Protocol Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cardArray.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! cardCollectionViewCell
        let card = cardArray[indexPath.row]
        cell.setCard(card)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! cardCollectionViewCell
        let card = cardArray[indexPath.row]
        if card.isFlipped == false && card.isMatched == false{
            cell.flip()
            card.isFlipped = true
        }
        if firstFlippedCard == nil {
            firstFlippedCard = indexPath
        }
        else {
            cardMatch(indexPath)
        }
        
        
    }
    func cardMatch(_ secondFlippedCard:IndexPath){
        
        if milliseconds <= 0 {
            return
        }
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCard!) as? cardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCard) as? cardCollectionViewCell
        
        let cardOne = cardArray[firstFlippedCard!.row]
        let cardTwo = cardArray[secondFlippedCard.row]
        
        if cardOne.imageName == cardTwo.imageName {
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) {
                cardOneCell?.remove()
                cardTwoCell?.remove()
               
            }
            checkGameEnded()
            
            
        }
        else {
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
            
            
        }
        if cardOneCell == nil {
            collectionView.reloadItems(at: [firstFlippedCard!])
        }
        firstFlippedCard = nil
    }
    
    func checkGameEnded() {
        var isWon = true
        for card in cardArray {
            if card.isMatched == false {
                isWon = false
                break
            }
            
            
        }
        var title = ""
        var message = ""
        
        if isWon == true {
            if milliseconds > 0 {
                timer?.invalidate()
                
            }
            title = "Congratulations!"
            message = "You've Won"
            
        }
        else {
            if milliseconds > 0 {
                return
            }
            title = "Game Over"
            message = "You've Lost"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Play Again", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        
    }


}

