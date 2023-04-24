//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Şahin Yürek on 3/2/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var storyLabel: UILabel!
    @IBOutlet var choice1Button: UIButton!
    @IBOutlet var choice2Button: UIButton!

    var storyBrain = StoryBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI()
    }

    func updateUI() {
        storyLabel.text = storyBrain.getStory()
        choice1Button.setTitle(storyBrain.getChoices(choiceNum: 1), for: .normal)
        choice2Button.setTitle(storyBrain.getChoices(choiceNum: 2), for: .normal)
    }
}
