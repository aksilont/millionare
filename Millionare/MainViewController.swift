//
//  ViewController.swift
//  Millionare
//
//  Created by Sky on 23.10.2020.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destionation = segue.destination as? GameViewController else { return }
            destionation.gameVCDelegate = self
            
            Game.shared.gameSession = GameSession()
        default:
            break
        }
    }
}

extension MainViewController: GameVCDelegate {
    func didAnswer(currentQuestion: Int, winningSum: Int, endTheGame: Bool) {
        guard let gameSession = Game.shared.gameSession else { return }
        gameSession.correctAnswers = currentQuestion
        gameSession.winningSum = winningSum
        print(gameSession.percentCorrectAnswer)
    }
}

