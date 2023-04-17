//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Şahin Yürek on 2/18/23.
//

import UIKit

class ViewController: UIViewController {
    let ballArray = [UIImage(imageLiteralResourceName: "ball1"), UIImage(imageLiteralResourceName: "ball2"), UIImage(imageLiteralResourceName: "ball3"), UIImage(imageLiteralResourceName: "ball4"), UIImage(imageLiteralResourceName: "ball5")]

    @IBOutlet var ImageView: UIImageView!

    @IBAction func askButtonPressed(_ sender: UIButton) {
        ImageView.image = ballArray.randomElement()
    }
}
