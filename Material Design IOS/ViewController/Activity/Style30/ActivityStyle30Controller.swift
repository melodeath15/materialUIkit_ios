//
//  ActivityStyle30Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit
import AVFoundation

class ActivityStyle30Controller: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewActivityStyle26Delegate, TextfieldActivityStyle26Delegate, ViewActivitySyle30Delegate {
    
    private var tableStyle: UITableView = UITableView() // var tableView
    var Nav = ViewActivityStyle26() // var view xib in folder style26 name ViewActivityStyle26
    var Footer = TextfieldActivityStyle26() // var view xib in folder style26 name TextfieldActivityStyle26
    var player: AVAudioPlayer! // var audioPlayer
    var playerStatus = false
    var timerPlay = Timer()
    var sliderPlay = UISlider() // var slider player
    var sliderLabel = UILabel() // var label time player
    var sliderButton = UIButton() // var button play player
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create nav, create header, create table and regis UINib, create footer
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        
        // Create Nav
        Nav = Bundle.main.loadNibNamed("ViewActivityStyle26", owner: nil, options: nil)?.first as! ViewActivityStyle26
        Nav.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        Nav.titleHeader.text = "Remi Boucher"
        Nav.imgProfile.image = #imageLiteral(resourceName: "profile2")
        Nav.time.text = "2 hours ago"
        Nav.delegate = self
        self.view.addSubview(Nav)
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80-50)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        // register UINib for ChatActivitySyle26Left, ChatActivityStyle26Right, ChatAcitivityStyle26Image
        tableStyle.register(UINib(nibName: "ViewActivitySyle30", bundle: nil), forCellReuseIdentifier: "ViewActivitySyle30")
        tableStyle.register(UINib(nibName: "ChatActivityStyle26Right", bundle: nil), forCellReuseIdentifier: "ChatActivityStyle26Right")
        tableStyle.register(UINib(nibName: "ViewActivityStyle30Map", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle30Map")
        self.view .addSubview(tableStyle)
        
        // Create Footer
        Footer = Bundle.main.loadNibNamed("TextfieldActivityStyle26", owner: nil, options: nil)?.first as! TextfieldActivityStyle26
        Footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        Footer.delegate = self
        self.view.addSubview(Footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 90
        }else if indexPath.row == 2 {
            return 250
        }else{
            return 71
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivitySyle30", for: indexPath) as! ViewActivitySyle30
            
            cell.sliderStatus.value = 0
            cell.sliderStatus.minimumValue = 0
            
            let path = URL(fileURLWithPath: Bundle.main.path(forResource: "audioFile", ofType:"mp3")!)

            do {
                player = try AVAudioPlayer(contentsOf: path)
                player.prepareToPlay()
                cell.sliderStatus.maximumValue = Float(player.duration)
                cell.timePlay.text = "00.00"
            }catch let error{
                print("error \(String(describing: error))")
            }
            
            cell.timePost.text = "14.22"
            cell.backgroundColor = UIColor.clear
            cell.index = indexPath as NSIndexPath
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatActivityStyle26Right", for: indexPath) as! ChatActivityStyle26Right
            cell.valueMessage.text = "Meet me at 10 PM"
            cell.time.text = "14.22"
            cell.backgroundColor = UIColor.clear
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle30Map", for: indexPath) as! ViewActivityStyle30Map
            cell.label.text = "26 Howard St, Chesapeake, VA 23320"
            cell.time.text = "14.22"
            cell.backgroundColor = UIColor.clear
            return cell
        default:
            break
        }
        
        let cell = UITableViewCell()
        return cell
    }
    
    // delegate ViewActivitySyle30Delegate
    func btnPlay(index: NSIndexPath, btn: UIButton, slider: UISlider, label: UILabel) { // for play player
        
        // replace object for controll
        sliderPlay = slider
        sliderLabel = label
        sliderButton = btn
        
        switch index.row {
        case 0:
            if playerStatus{
                player.play()
                startTimer()
                btn.setImage(#imageLiteral(resourceName: "Pause"), for: .normal)
                playerStatus = false
            }else{
                player.pause()
                stopTimer()
                btn.setImage(#imageLiteral(resourceName: "Play"), for: .normal)
                playerStatus = true
            }
        default:
            break
        }
        
    }
    
    func statusChange(status: UISlider, label: UILabel) { // for gesture player
        player.currentTime = TimeInterval(status.value)
        label.text = FunctionDefault.secondsToHoursMinutesSeconds(seconds: Int(TimeInterval(status.value)))
    }
    
    func btnTimer() { // for timer player
        sliderPlay.value = Float(player.currentTime)
        sliderLabel.text = FunctionDefault.secondsToHoursMinutesSeconds(seconds: Int(Float(player.currentTime)))
        
        if Int(sliderPlay.maximumValue)-1 == Int(Float(player.currentTime)){
            timerPlay.invalidate()
            sliderPlay.value = 0
            sliderLabel.text = "00:00"
            sliderButton.setImage(#imageLiteral(resourceName: "Play"), for: .normal)
            playerStatus = true
        }
        
    }
    // end
    
    func startTimer(){
        timerPlay = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(btnTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer(){
        timerPlay.invalidate()
    }
    
    // ViewActivityStyle26Delegate
    func MenuOrBack() { // function for back layout
        player.stop()
        navigationController?.popViewController(animated: true)
    }
    
    func Option() { // function for menu option
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
    // end
    
    // TextfieldActivityStyle26Delegate
    func textChange(text: String, tag: NSInteger) {
        print("text change \(text)")
    }
    
    func Send() {
        FunctionDefault.AlertMessage(title: "Send", message: "", targetVC: self)
    }
    
    func attc() {
        FunctionDefault.AlertMessage(title: "attachment", message: "", targetVC: self)
    }
    // end
    
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
