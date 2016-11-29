//
//  PlaySoundsViewController.swift
//  ProjectPitchPerfect
//
//  Created by J on 29/11/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var sliderValue: UISlider!
    
    var recordedAudioURL: NSURL!
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode:AVAudioPlayerNode!
    var stopTimer:Timer!
    
    enum ButtonType: Int {
        case vader = 0, chipmunk = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .vader:
            playSound(rate: sliderValue.value, pitch:-1000)
        case .chipmunk:
            playSound(rate: sliderValue.value, pitch:1000)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed (_ sender: UIButton) {
        stopAudio()
    }

}
