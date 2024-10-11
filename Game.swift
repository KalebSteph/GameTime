//
//  Game.swift
//  GameTime
//
//  Created by Kaleb Stephens on 10/11/24.
//

import Foundation

class RockPaperScissorsGame {
    var userScore = 0
    var computerScore = 0
    let totalRounds = 3
    
    func getUserChoice() -> String {
        print("Choose Rock, Paper, or Scissors:")
        if let userInput = readLine()?.lowercased() {
            if userInput == "rock" || userInput == "paper" || userInput == "scissors" {
                return userInput
            } else {
                print("Invalid choice, please enter Rock, Paper, or Scissors.")
                return getUserChoice()
            }
        }
        return ""
    }

    func getComputerChoice() -> String {
        let choices = ["rock", "paper", "scissors"]
        let randomIndex = Int(arc4random_uniform(3))
        return choices[randomIndex]
    }

    // Function to determine the winner
    func determineWinner(userChoice: String, computerChoice: String) {
        print("You chose \(userChoice.capitalized), Computer chose \(computerChoice.capitalized).")
        
        if userChoice == computerChoice {
            print("It's a tie!")
        } else if (userChoice == "rock" && computerChoice == "scissors") ||
                  (userChoice == "paper" && computerChoice == "rock") ||
                  (userChoice == "scissors" && computerChoice == "paper") {
            print("You win this round!")
            userScore += 1
        } else {
            print("Computer wins this round!")
            computerScore += 1
        }
    }
    
    // Function to play the game for 3 rounds
    func playRounds() {
        for round in 1...totalRounds {
            print("\n--- Round \(round) ---")
            let userChoice = getUserChoice()
            let computerChoice = getComputerChoice()
            determineWinner(userChoice: userChoice, computerChoice: computerChoice)
            print("Score: You \(userScore) - \(computerScore) Computer\n")
        }
    }

    // Function to display final results
    func displayFinalResults() {
        print("Final Results")
        if userScore > computerScore {
            print("Congratulations! You won!")
        } else if computerScore > userScore {
            print("Sorry, the computer won!")
        } else {
            print("It's a tie game!")
        }
        print("Final Score: You \(userScore) - \(computerScore) Computer")
    }
}
