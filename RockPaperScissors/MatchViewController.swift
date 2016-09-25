//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Gaurav Saraf on 9/24/16.
//  Copyright © 2016 Gaurav Saraf. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {

    var userSelected:RandomDraw!

    func drawRandomResult() -> RandomDraw! {
        let random = 1 + arc4random() % 3
        let randomDraw = Int(random)
        return RandomDraw(rawValue: randomDraw)
    }
    
    @IBAction func rockButtonAction() {
        self.userSelected = RandomDraw.Rock
        let draw = drawRandomResult()
        if let draw = draw {
            var controller:ResultViewController
            controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            controller.randomDraw = draw
            controller.userSelectedDraw = userSelected
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func paperButtonAction() {
        performSegue(withIdentifier: "showResultPaper", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultPaper" {
            let draw = drawRandomResult()
            if let draw = draw {
                let controller = segue.destination as! ResultViewController
                controller.randomDraw = draw
                controller.userSelectedDraw = RandomDraw.Paper
            }
        } else if segue.identifier == "showResultScissors" {
            let draw = drawRandomResult()
            if let draw = draw {
                let controller = segue.destination as! ResultViewController
                controller.randomDraw = draw
                controller.userSelectedDraw = RandomDraw.Scissors
            }
        }
    }
}

