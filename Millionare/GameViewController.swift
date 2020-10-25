//
//  GameViewController.swift
//  Millionare
//
//  Created by Sky on 25.10.2020.
//

import UIKit

protocol GameVCDelegate: AnyObject {
    func didAnswer(currentQuestion: Int, winningSum: Int, endTheGame: Bool)
}

class GameViewController: UIViewController {

    @IBOutlet weak var currentWinningSum: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    weak var gameVCDelegate: GameVCDelegate?
    
    var currentQuestion = 0
    var currentSum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }
    
    func nextQuestion() {
        guard let questions = Game.shared.gameSession?.questions,
              currentQuestion <= questions.count - 1
              else { return }
        let question = questions[currentQuestion]
        questionLabel.text = "\(currentQuestion + 1). \(question.question)"
        var currentAnswer = 0
        var word = ""
        for text in question.answers.keys {
            switch currentAnswer {
            case 0:
                word = "A. "
            case 1:
                word = "B. "
            case 2:
                word = "C. "
            case 3:
                word = "D. "
            default:
                word = ""
            }
            answerButtons.first { (button) -> Bool in
                button.tag == currentAnswer
            }?.setTitle(word + text, for: .normal)
            currentAnswer += 1
        }
    }
    
    @IBAction func answerTapped(_ sender: UIButton) {
        guard let questions = Game.shared.gameSession?.questions,
              currentQuestion <= questions.count - 1
              else { return }
        let question = questions[currentQuestion]
        let currentAnswer = question.answers.first { (key, value) -> Bool in
            (sender.titleLabel?.text?.contains(key) ?? false)
        }!
        if currentAnswer.value {
            currentSum = currentQuestion == 0 ? 100 : currentSum * 2
            currentQuestion += 1
            currentWinningSum.text = "Текущий выигрыш: \(currentSum)"
            nextQuestion()
        } else {
            gameVCDelegate?.didAnswer(currentQuestion: currentQuestion + 1, winningSum: currentSum, endTheGame: true)
            dismiss(animated: true, completion: nil)
        }
        
    }
    
}
