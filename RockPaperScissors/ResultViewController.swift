//
//  ResultViewController.swift
//  RockPaperScissors
//
//  Created by Gaurav Saraf on 9/24/16.
//  Copyright © 2016 Gaurav Saraf. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultImage:UIImageView!
    @IBOutlet weak var resultMessage:UILabel!
    
    var randomDraw:RandomDraw?
    var userSelectedDraw:RandomDraw?
    
    override func viewWillAppear(_ animated: Bool) {
        calculateResult()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.resultImage.alpha = 1
        }
    }
    
    @IBAction func playAgain() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func calculateResult()
    {
        if let randomDraw = randomDraw {
            if let userSelectedDraw = userSelectedDraw {
                if randomDraw == userSelectedDraw {
                    self.resultImage.image = UIImage(named: "\(#imageLiteral(resourceName: "itsATie"))")
                    self.resultMessage.text = "It's a tie!"
                } else if (randomDraw == RandomDraw.Rock && userSelectedDraw == RandomDraw.Scissors) || (randomDraw == RandomDraw.Scissors && userSelectedDraw == RandomDraw.Rock) {
                    self.resultImage.image = UIImage(named: "\(#imageLiteral(resourceName: "RockCrushesScissors"))")
                    self.resultMessage.text = "Rock crushes Scissors!"
                } else if (randomDraw == RandomDraw.Paper && userSelectedDraw == RandomDraw.Rock) || (randomDraw == RandomDraw.Rock && userSelectedDraw == RandomDraw.Paper) {
                    self.resultImage.image = UIImage(named: "\(#imageLiteral(resourceName: "PaperCoversRock"))")
                    self.resultMessage.text = "Paper covers Rock!"
                } else if (randomDraw == RandomDraw.Paper && userSelectedDraw == RandomDraw.Scissors) || (randomDraw == RandomDraw.Scissors && userSelectedDraw == RandomDraw.Paper) {
                    self.resultImage.image = UIImage(named: "\(#imageLiteral(resourceName: "ScissorsCutPaper"))")
                    self.resultMessage.text = "Scissors cuts Paper!"
                }
                self.resultImage.alpha = 0
            } else {
                self.resultMessage.text = "No result!"
            }
        } else {
            self.resultMessage.text = "No result"
        }
    }
}
