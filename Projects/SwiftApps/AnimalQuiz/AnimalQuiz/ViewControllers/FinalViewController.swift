//
//  FinalViewController.swift
//  AnimalQuiz
//
//  Created by hutzo on 13.10.2021.
//

import UIKit

class FinalViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    var answers = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: true)
        
        if let animalType = defineResultType() {
            showResult(animalType)
        }
    }
    
    private func defineResultType() -> AnimalType? {
        let firstSolution = answers.filter({ answer in answers.contains { $0.type == answer.type}}).first?.type
        let secondSolution = Dictionary(grouping: answers, by: {$0.type}).sorted(by: {$0.value.count > $1.value.count}).first?.key
        
        print("firstSolution - \(firstSolution!)")
        print("secondSolution - \(secondSolution!)")
        
        var countAnimalAnswers = [AnimalType: Int]()
        let animalsTypes = answers.map {$0.type}
        
        for animalType in animalsTypes {
            if let count = countAnimalAnswers[animalType] {
                countAnimalAnswers.updateValue(count + 1, forKey: animalType)
            } else {
                countAnimalAnswers[animalType] = 1
            }
        }
        
        for animalType in animalsTypes {
            countAnimalAnswers[animalType] = (countAnimalAnswers[animalType] ?? 0) + 1
        }
        
        print("countAnimalAnswers \(countAnimalAnswers)")
        
        return countAnimalAnswers.sorted(by: {$0.value > $1.value}).first?.key
    }
    
    private func showResult(_ animalType: AnimalType) {
        titleLabel.text = "Вы - \(animalType.rawValue)"
        textLabel.text = animalType.definition
    }
}
