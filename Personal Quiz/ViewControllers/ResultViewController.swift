//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by 18992227 on 31.05.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        resultPersonalQuiz()
    }
    
    func resultPersonalQuiz() {
        var scoreOfAnswer: [AnimalType: Int] = [:]
        let answerTypes = answers.map{ $0.type }
        
        for answer in answerTypes {
            scoreOfAnswer[answer] = (scoreOfAnswer[answer] ?? 0) + 1
        }
        print(scoreOfAnswer)
        
        let scoreAnswersSorted = scoreOfAnswer.sorted(by: {(value1, value2) -> Bool in return value1.value > value2.value})
        let finalResaultQuiz = scoreAnswersSorted.first!.key
        
        resultAnswerLabel.text = "Вы - \(finalResaultQuiz.rawValue)!"
        resultDefinitionLabel.text = finalResaultQuiz.definition
    }
}
