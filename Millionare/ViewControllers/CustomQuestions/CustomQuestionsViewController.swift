//
//  CustomQuestionsViewController.swift
//  Millionare
//
//  Created by Sky on 30.10.2020.
//

import UIKit

protocol CustomQuestionsVCDelegate: AnyObject {
    func saveQuestions(_ questions: [Question])
}

class CustomQuestionsViewController: UIViewController {
    
    var questionBuilder = QuestionBuilder()
    
    var customQuestionDelegate: CustomQuestionsVCDelegate?
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet var answersTextFields: [UITextField]!
    
    @IBOutlet var checkBoxButtons: [CheckBox]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        questionBuilder.setTextQuestion(questionTextView.text)
        for answerTextField in answersTextFields {
            var correctAnswer = false
            if let checkBox = checkBoxButtons.first(where: { $0.tag == answerTextField.tag}) {
                correctAnswer = checkBox.isChecked
            }
            questionBuilder.addAnswer(answerTextField.text ?? "", correct: correctAnswer)
        }
        customQuestionDelegate?.saveQuestions(questionBuilder.build())
        dismiss(animated: true, completion: nil)
    }
    
}
