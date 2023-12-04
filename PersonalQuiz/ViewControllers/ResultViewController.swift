//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    private var results: [Animal : Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        checkResult(for: answersChosen)
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func checkResult(for answers: [Answer]) {
        var resultCount = 1
        for answer in answers {
            if !results.keys.contains(answer.animal) {
                results[answer.animal] = resultCount
            } else {
                resultCount += 1
                results[answer.animal] = resultCount
            }
        }
        
        let sortedResult = results.sorted{ $0.value > $1.value }
        guard let result = sortedResult.first?.key else { return }
        
        establishResult(from: result)
    }
    
    private func establishResult(from result: Animal) {
        resultLabel.text = "Вы - \(result.rawValue)"
        descriptionLabel.text = result.definition
    }
}
