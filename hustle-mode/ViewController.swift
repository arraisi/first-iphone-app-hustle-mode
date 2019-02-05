//
//  ViewController.swift
//  hustle-mode
//
//  Created by Abdul R Arraisi on 05/02/19.
//  Copyright © 2019 Abdul R Arraisi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var onLbl: UILabel!
    @IBOutlet weak var powerBtn: UIButton!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }


    @IBAction func powerButtonAction(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isEnabled = true
        player.play()
        
        UIView.animate(withDuration: 2.3
            , animations: {
                self.rocket.frame = CGRect(x: 0
                    , y: 140
                    , width: 375
                    , height: 402)
        }) { (finished) in
            self.hustleLbl.isHidden = false
            self.onLbl.isHidden = false
        }
    }
}

