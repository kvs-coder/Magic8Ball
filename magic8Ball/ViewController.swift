//
//  ViewController.swift
//  magic8Ball
//
//  Created by Victor Kachalov on 25.11.2017.
//  Copyright © 2017 Victor Kachalov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImage: UIImageView!
    @IBOutlet weak var shakeBtn : UIButton! {
        didSet {
            shakeBtn.layer.cornerRadius = shakeBtn.bounds.height / 3
        }
    }
    
    private var randomAnswerIndex : Int = 0
    private let answerImagesArray : [String] = ["ball1",
                                                "ball2",
                                                "ball3",
                                                "ball4",
                                                "ball5",]
    
    private func getAnswerImage() {
        randomAnswerIndex = Int(arc4random_uniform(5))
        ballImage.image   = UIImage(named: answerImagesArray[randomAnswerIndex])
    }
    
    @IBAction func shaked(_ sender: UIButton) {
        shakeBall()
        getAnswerImage()
    }
    
    private func shakeBall() {
        let animation = CABasicAnimation(keyPath: "position")
        
        animation.duration     = 0.1
        animation.repeatCount  = 2
        animation.autoreverses = true
        animation.fromValue    = CGPoint(x: self.ballImage.center.x,
                                         y: self.ballImage.center.y + 40)
        animation.toValue      = CGPoint(x: self.ballImage.center.x,
                                         y: self.ballImage.center.y - 40)
        
        self.ballImage.layer.add(animation, forKey: "position")
    }
    
    
}

