 //
//  ViewController.swift
//  RetroCalculator
//
//  Created by Jitendra Ram on 10/13/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    
    var currentOperation = Operation.Empty
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var leftVarStr = ""
    var rightVarStr = ""
    var result = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundUrl)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @ IBAction func numberPressed(sender: UIButton){
        playSound()
        
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
         btnSound.play()
    }

    func processOperation(operation: Operation) {
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightVarStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                
                } else if currentOperation == Operation.Divide {
                
                } else if currentOperation == Operation.Subtract {
                
                } else if currentOperation == Operation.Add {
                    
                }
                
            }
        }
    }
}

