//
//  CardModel.swift
//  Match App
//
//  Created by Cosmin Iulian on 17/12/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card]{
        
        // Declare an array to store the numbers we've already generated
        var generatedNumbersArray = [Int]()
        
        // Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly generate pairs of cards
        while generatedNumbersArray.count < 8 {
            
            // Generate a random number
            let randomNr = arc4random_uniform(13) + 1
            
            // Ensure that the random number isn't one we already have
            if generatedNumbersArray.contains(Int(randomNr)) == false {
                
                // Store the number into the generatedNumbersArray
                generatedNumbersArray.append(Int(randomNr))
                
                // Create the first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNr)"
                
                generatedCardsArray.append(cardOne)
                
                // Create the second card object
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNr)"
                
                generatedCardsArray.append(cardTwo)
            }
        }
        
        // Randomize the array
        
        for i in 0...generatedCardsArray.count-1 {
            
            // Find a random index to swap with
            let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
            
            // Swap the two cards
            let temp = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[randomNumber]
            generatedCardsArray[randomNumber] = temp
        }
        
        // Return the array
        return generatedCardsArray
    }
    
}

