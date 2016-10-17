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
    
    var btnSound: AVAudioPlayer!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var runningNumber = ""
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var currentOperation = Operation.Empty
    var leftValStr = ""
    var rightValStr = ""
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
        outputLabel.text = "0"
    }
    
    @ IBAction func numberPressed(sender: UIButton){
        playSound()
        
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
    }
    
    @IBAction func onDividePressed(_ sender: AnyObject) {
        processOperation(operation: .Divide)
    }
    
    @IBAction func onMultiplyPressed(_ sender: AnyObject) {
        processOperation(operation: .Multiply)
    }

    @IBAction func onSubtractPressed(_ sender: AnyObject) {
        processOperation(operation: .Subtract)
    }

    @IBAction func onAddPressed(_ sender: AnyObject) {
        processOperation(operation: .Add)
    }

    @IBAction func onEqualPressed(_ sender: AnyObject) {
        processOperation(operation: currentOperation )
    }
    
    
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
         btnSound.play()
    }

    func processOperation(operation: Operation) {
        playSound()
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLabel.text = result
            }
            currentOperation = operation
        }else {
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

