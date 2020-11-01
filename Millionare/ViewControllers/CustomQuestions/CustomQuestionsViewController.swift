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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet var answersTextFields: [UITextField]!
    
    @IBOutlet var checkBoxButtons: [CheckBox]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
    }

    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = .zero
    }
    
    @IBAction func scrollTaped(_ gesture: UIGestureRecognizer){
        scrollView.endEditing(true)
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
