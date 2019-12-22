//
//  CardCollectionViewCell.swift
//  Match App
//
//  Created by Cosmin Iulian on 17/12/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    var card: Card?
    
    
    func setCard(_ card: Card) {
        
        // Keep track of the card that gets passed in
        self.card = card
        
        frontImageView.image = UIImage(named: card.imageName)
        
        if card.isMatched == true {
            
            // If the cards has been matched, then make the image views invisible
            backImageView.alpha = 0
            frontImageView.alpha = 0
            
            return // exit the method
        }
        else {
            // If the cards hasn't been matched, then make the image views visible
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        
        // Determine if the card is in a flipped up state or flipped down state
        if card.isFlipped == false {
            
            // Make sure the backImageView is on top
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews])
        }
        else{
            
            // Make sure the frontImageView is on top
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews])
        }
    }
    
    
    func flip() {
        
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews])
        
    }
    
    
    func flipBack() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) { // execute the code between curly brackets after 0.5 seconds
            
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews])
        }
    }
    
    
    func remove() {
        
        // Removes both imageviews from being visible
        backImageView.alpha = 0
        
        // Animate it
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0
        })
    }
    
}

