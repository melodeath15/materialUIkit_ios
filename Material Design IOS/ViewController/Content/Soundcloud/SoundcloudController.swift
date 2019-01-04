//
//  SoundcloudController.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/24/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit
import AVFoundation

class SoundcloudController: UIViewController, SoundcloudHeaderDelegate, SoundcloudViewDelegate {
    
    var header = SoundcloudHeader()
    var viewPlayer = SoundcloudView()
    
    var songPlayer = AVAudioPlayer()
    var hasBeenPaused = false
    var timerPlay = Timer()
    var maxTime = Float()

    var dataPost = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
        prepareSongAndSession()

    }
    
    func prepareSongAndSession() {
        
        do {
            //7 - Insert the song from our Bundle into our AVAudioPlayer
            let path = URL(fileURLWithPath: Bundle.main.path(forResource: "Nella", ofType:"mp3")!)
            songPlayer = try AVAudioPlayer(contentsOf: path)
            //8 - Prepare the song to be played
            songPlayer.prepareToPlay()
            
            //9 - Create an audio session
            let audioSession = AVAudioSession.sharedInstance()
            do {
                //10 - Set our session category to playback music
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                //11 -
            } catch let sessionError {
                
                print(sessionError)
            }
            //12 -
        } catch let songPlayerError {
            print(songPlayerError)
        }
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.white
        
        // create player
        viewPlayer = Bundle.main.loadNibNamed("SoundcloudView", owner: nil, options: nil)?.first as! SoundcloudView
        viewPlayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        viewPlayer.img.image = UIImage(named: "imgSound")
        viewPlayer.title.text = "Nella Kharisma - Ninja Opo Vespa"
        viewPlayer.deskripsi.text = "Indonesia"
        viewPlayer.delegate = self
        self.view.addSubview(viewPlayer)
        
        
        // create header
        header = Bundle.main.loadNibNamed("SoundcloudHeader", owner: nil, options: nil)?.first as! SoundcloudHeader
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.delegate = self
        self.view.addSubview(header)
        
    }
    
    // SoundcloudHeaderDelegate
    func back() {
        stopTimer()
        songPlayer.stop()
        navigationController?.popViewController(animated: true)
    }
    
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)

    }
    
    func love() {
        FunctionDefault.AlertMessage(title: "Love", message: "", targetVC: self)

    }
    
    // SoundcloudViewDelegate
    func stop() {
        songPlayer.stop()
        songPlayer.currentTime = 0
        viewPlayer.imgPlay.image = UIImage(named: "play")
        viewPlayer.progres.progress = Float(0)
        stopTimer()
    }
    
    func backSong() {
        FunctionDefault.AlertMessage(title: "Back", message: "", targetVC: self)
    }
    
    func nextSong() {
        FunctionDefault.AlertMessage(title: "Next", message: "", targetVC: self)
    }
    
    func play() {
        print(songPlayer.duration)

        if songPlayer.isPlaying{
            songPlayer.pause()
            hasBeenPaused = true
            
            viewPlayer.imgPlay.image = UIImage(named: "play")
        }else{
            songPlayer.play()
            hasBeenPaused = false
            
            viewPlayer.imgPlay.image = UIImage(named: "pause")
            startTimer()
        }
    }
    
    func btnTimer() { // for timer player
        viewPlayer.progres.progress = Float(songPlayer.currentTime/songPlayer.duration)
        if songPlayer.currentTime/songPlayer.duration == 0{
            stopTimer()
            viewPlayer.imgPlay.image = UIImage(named: "play")
        }
    }
    
    func startTimer(){
        timerPlay = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(btnTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer(){
        timerPlay.invalidate()
    }
    
    func menuOption() {
        let actionSheet: UIAlertController = UIAlertController(title: "Choose Option", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {_ in // function for butoon down
            FunctionDefault.AlertMessage(title: "Cancel", message: "", targetVC: self)
        }
        actionSheet.addAction(cancelAction)
        
        
        let saveAction = UIAlertAction(title: "Save", style: .default){ _ in // function button custom
            FunctionDefault.AlertMessage(title: "Save", message: "", targetVC: self)
        }
        actionSheet.addAction(saveAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive){ _ in // function button custom with destructive
            FunctionDefault.AlertMessage(title: "Delete", message: "", targetVC: self)
        }
        actionSheet.addAction(deleteAction)
        
        actionSheet.popoverPresentationController?.sourceView = self.view
        actionSheet.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.width-20, y: 60, width: 1, height: 1)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent // return for status bar lightcontent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
