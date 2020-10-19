//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Hard": 720, "Medium": 420, "Soft": 30]
    var secondsRemaining = 0
    var copyOfEggTimes = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var doneScreenAppeared: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()

    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        copyOfEggTimes = eggTimes[hardness]!
        progressBar.progress = 0.0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeUpdate), userInfo: nil, repeats: true)
        
        
      }
    
    @objc func timeUpdate(){
        
    if secondsRemaining > 0{
        print(secondsRemaining)
        progressBar.progress = 1.0 - Float(secondsRemaining) / Float(copyOfEggTimes)
        secondsRemaining -= 1
    }else if secondsRemaining == 0{
        doneScreenAppeared.text = "Done"
        progressBar.progress = 1.0
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    player = try! AVAudioPlayer(contentsOf: url!)
                    player.play()
    }
    }
    
}
    

