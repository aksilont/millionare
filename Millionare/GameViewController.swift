//
//  GameViewController.swift
//  Millionare
//
//  Created by Sky on 25.10.2020.
//

import UIKit

protocol GameVCDelegate: AnyObject {
    func didAnswer(question: Question, endTheGame: Bool)
}

class GameViewController: UIViewController {

    weak var gameVCDelegate: GameVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
