//
//  AddQuestionsTableViewCell.swift
//  Millionare
//
//  Created by Sky on 28.10.2020.
//

import UIKit

class AddQuestionsTableViewCell: UITableViewCell {

    @IBOutlet weak var textQuestionLabel: UILabel!
    @IBOutlet var answersCollectionLabel: [UILabel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(item: Question) {
        textQuestionLabel.text = item.text
        
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
            
            if let label = answersCollectionLabel.first(where: { $0.tag == currentAnswer }) {
                label.text = word + answer.answer
                if answer.correct {
                    label.textColor = UIColor.green
                }
            }
            currentAnswer += 1
        }
    }
    
}
