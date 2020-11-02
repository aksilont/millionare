//
//  QuestionsCell.swift
//  Millionare
//
//  Created by Sky on 29.10.2020.
//

import UIKit

class QuestionsCell: UITableViewCell {

    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet var answersTextFields: [UITextField]!
    
    @IBOutlet var checkBoxButtons: [CheckBox]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    func configure(questionsCustom: [Question], indexPath: IndexPath) {
        let item = questionsCustom[indexPath.row]
        
        questionTextView.text = item.text
        
        var currentAnswer = 0
        var word = ""
        for answer in item.answers {
            
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
            
            if let textField = answersTextFields.first(where: { $0.tag == currentAnswer }) {
                textField.text = word + answer.answer
                if answer.correct {
                    textField.textColor = .green
                    if let checkBox = checkBoxButtons.first(where: { $0.tag == currentAnswer}) {
                        checkBox.isChecked = true
                    }
                }
            }
            currentAnswer += 1
        }
    }
    
    override func prepareForReuse() {
        questionTextView.text = ""
        checkBoxButtons.forEach { $0.isChecked = false }
        answersTextFields.forEach { (textField) in
            textField.text = ""
            textField.textColor = .black
        }
    }
    
}
