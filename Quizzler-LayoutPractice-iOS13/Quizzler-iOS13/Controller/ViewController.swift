//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Şahin Yürek on 3/2/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var choice1: UIButton!
    @IBOutlet var choice2: UIButton!
    @IBOutlet var choice3: UIButton!

    var quizBrain = QuizBrain()
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else { sender.backgroundColor = UIColor.red }
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        quizBrain.nextQuestion()
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        choice1.setTitle(quizBrain.getChoices(choiceNum: 0), for: .normal)
        choice2.setTitle(quizBrain.getChoices(choiceNum: 1), for: .normal)
        choice3.setTitle(quizBrain.getChoices(choiceNum: 2), for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
}
