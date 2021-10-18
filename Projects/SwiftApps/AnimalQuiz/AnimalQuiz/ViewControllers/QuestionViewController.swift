//
//  QuestionViewController.swift
//  AnimalQuiz
//
//  Created by hutzo on 13.10.2021.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangeStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var rangedLabels: [UILabel]!
    
    // MARK: Properties
    
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
}

extension QuestionViewController {
    
    private func updateUI() {
        // Hide stacks
        for stackView in [singleStackView, multipleStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        
        // get current question
        let currentQuestion = questions[questionIndex]
        
        // set current question for label
        questionLabel.text = currentQuestion.text
        
        // calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // set progress for progressView
        progressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        // show current StackView
    }
    
    private func showCurrentStackView(for type: ResponseType) {
        switch type {
        case .single:
            break
        case .multiple:
            break
        case .range:
            break
        }
    }
        
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
}
