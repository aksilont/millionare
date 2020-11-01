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
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var currentWinningSum: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    weak var gameVCDelegate: GameVCDelegate?
    
    var questions: [Question] = []
    var currentQuestion = Observable<Int>(0)
    var currentSum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setObserver()
        if loadQuestion() {
            progressLabel.text =
                "Прогресс: \(currentQuestion.value) из \(questions.count) вопросов, % правильных ответов: \(Game.shared.gameSession?.percentCorrectAnswer ?? 0)"
            nextQuestion()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        currentQuestion.removeObserver(self)
    }
    
    private func loadQuestion() -> Bool {
        guard let gameSession = Game.shared.gameSession else { return false }
        questions = gameSession.questions
        return true
    }
    
    private func setObserver() {
        currentQuestion.addObserver(self, options: [.initial, .new, .old]) { [weak self] (numberQuestion, _) in
            guard let self = self else { return }
            self.progressLabel.text =
                "Прогресс: \(numberQuestion) из \(self.questions.count) вопросов, % правильных ответов: \(Game.shared.gameSession?.percentCorrectAnswer ?? 0)"
        }
    }
    func nextQuestion() {
        guard questions.isEmpty == false,
              currentQuestion.value <= questions.count - 1
        else { return }
        let question = questions[currentQuestion.value]
        questionLabel.text = "\(currentQuestion.value + 1). \(question.text)"
        var currentAnswer = 0
        var word = ""
        let answers = question.answers.shuffled()
        for item in answers {
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
            }?.setTitle(word + item.answer, for: .normal)
            currentAnswer += 1
        }
    }
    
    @IBAction func answerTapped(_ sender: UIButton) {
        guard questions.isEmpty == false,
              currentQuestion.value <= questions.count - 1
        else { return }
        
        let question = questions[currentQuestion.value]
        let answers = question.answers
        guard let currentAnswer = answers.first(where: { (item) -> Bool in
            sender.titleLabel?.text?.contains(item.answer) ?? false
        }) else { return }
        
        if currentAnswer.correct {
            currentSum = currentQuestion.value == 0 ? 100 : currentSum * 2
            if currentQuestion.value == questions.count - 1 {
                gameVCDelegate?.didAnswer(
                    currentQuestion: currentQuestion.value + 1,
                    winningSum: currentSum,
                    endTheGame: true
                )
                dismiss(animated: true, completion: nil)
            } else {
                currentWinningSum.text = "Текущий выигрыш: \(currentSum)"
                gameVCDelegate?.didAnswer(
                    currentQuestion: currentQuestion.value + 1,
                    winningSum: currentSum,
                    endTheGame: false
                )
            }
            currentQuestion.value += 1
            nextQuestion()
        } else {
            gameVCDelegate?.didAnswer(
                currentQuestion: currentQuestion.value,
                winningSum: currentSum,
                endTheGame: true
            )
            dismiss(animated: true, completion: nil)
        }
        
    }
    
}
