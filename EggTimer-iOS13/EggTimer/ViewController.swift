//
//  ViewController.swift
//  EggTimer
//
//  Created by Şahin Yürek on 2/25/23.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet var eggText: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 10, "Medium": 15, "Hard": 20]
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        secondsPassed = 0
        progressBar.progress = 0
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            eggText.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
