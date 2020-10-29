//
//  CustomQuestionVC.swift
//  Millionare
//
//  Created by Sky on 29.10.2020.
//

import UIKit

class CustomQuestionVC: UIViewController {

    let questionBuilder = QuestionBuilder()
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet var answersTextFields: [UITextField]!
    
    @IBOutlet var checkBoxButtons: [CheckBox]!
    
    @IBAction func addQuestionTapped(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
