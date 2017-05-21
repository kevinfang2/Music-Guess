//
//  ViewController.swift
//  music guess
//
//  Created by Kevin Fang on 5/17/17.
//  Copyright © 2017 Kevin Fang. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate{

    var dict:[String:AnyObject]!
    var mediaPicker: MPMediaPickerController?
    var nowPlaying: MPMediaItem?
    var songTitleCollection:[String]!
    var correct:String!
    var points:Int!
    var counter:Int!
    var timeElapsed:Int!
    var timer:Timer!
    
    @IBOutlet weak var pointTitle: UINavigationItem!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    
    @IBAction func button1(_ sender: Any) {
        if(labelOne.text == correct){
            points! += (Int)(20/(timeElapsed! + 1));
        }
        else{
            points! -= 10;
        }
        afterAnswer()
    }
    
    @IBAction func button2(_ sender: Any) {
        if(labelTwo.text == correct){
            points! += (Int)(20/(timeElapsed! + 1));
        }
        else{
            points! -= 10;
        }
        afterAnswer()
    }
    
    @IBAction func button3(_ sender: Any) {
        if(labelThree.text == correct){
            points! += (Int)(20/(timeElapsed! + 1));
        }
        else{
            points! -= 10;
        }
        afterAnswer()
    }
    
    @IBAction func button4(_ sender: Any) {
        if(labelFour.text == correct){
            points! += (Int)(20/(timeElapsed! + 1));
        }
        else{
            points! -= 10;
        }
        afterAnswer()
    }
    
    
    var musicPlayer: MPMusicPlayerController {
        if musicPlayer_Lazy == nil {
            musicPlayer_Lazy = MPMusicPlayerController.systemMusicPlayer()
            
            let center = NotificationCenter.default
            center.addObserver(self,
                               selector: #selector(self.playingItemDidChange),
                               name: NSNotification.Name.MPMusicPlayerControllerNowPlayingItemDidChange,
                               object: musicPlayer_Lazy)
            musicPlayer_Lazy!.beginGeneratingPlaybackNotifications()
        }
        return musicPlayer_Lazy!
    }
    private var musicPlayer_Lazy: MPMusicPlayerController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 0;
        points = 0;
        timeElapsed = 0;
        pointTitle.title = String(points);
        
        songTitleCollection = [String].init();
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                print("authorized");
                self.play()
            }
        }
    }
    
    func play(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counterTimer), userInfo: nil, repeats: true)
        timer.fire();
        
        var mediaItems = MPMediaQuery.songs().items
        let random = randomInt(max: ((mediaItems?.count)! - 1));
        
        
        let mediaCollection = MPMediaItemCollection(items: [mediaItems![random]])
        correct = (mediaItems?[random].title)!;

        songTitleCollection.append((mediaItems?[random].title)!);
        mediaItems?.remove(at: random);
        
        for x in 0 ..< 3 {
            let random = randomInt(max: ((mediaItems?.count)! - 1));
            songTitleCollection.append((mediaItems?[random].title)!);
            mediaItems?.remove(at: random);
        }

        musicPlayer.setQueue(with: mediaCollection)
        musicPlayer.play()

        nowPlaying = musicPlayer.nowPlayingItem

        print((nowPlaying?.title)!);
        DispatchQueue.main.async {
            var same = self.songTitleCollection
            
            let random = randomInt(max: ((same?.count)! - 1));
            self.labelOne.text = same?[random];
            same?.remove(at: random);
            
            let random2 = randomInt(max: ((same?.count)! - 1));
            self.labelTwo.text = same?[random2];
            same?.remove(at: random2);
            
            let random3 = randomInt(max: ((same?.count)! - 1));
            self.labelThree.text = same?[random3];
            same?.remove(at:random3);
            
            self.labelFour.text = same?[0];
            self.songTitleCollection = [String].init();
        }
    }
    
    func playingItemDidChange(notification: NSNotification) {
        nowPlaying = musicPlayer.nowPlayingItem
    }
    
    func afterAnswer(){
        counter! += 1;
        if(counter == 10){
            //present next thing
        }
        print(timeElapsed!);
        timeElapsed! = 0;
        timer.invalidate();
        
        self.pointTitle.title = String(points);
        musicPlayer.stop()
        self.play();
    }
    
    func counterTimer() {
        timeElapsed! += 1
    }
    
    func displayMediaLibraryError() {
        var error: String
        switch MPMediaLibrary.authorizationStatus() {
        case .restricted:
            error = "Media library access restricted by corporate or parental settings"
        case .denied:
            error = "Media library access denied by user"
        default:
            error = "Unknown error"
        }
        
        let controller = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(controller, animated: true, completion: nil)
    }

//    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection){
//        myMusicPlayer = MPMusicPlayerController()
//        
//        if let player = myMusicPlayer{
//            player.beginGeneratingPlaybackNotifications()
//            var random = randomInt(max: mediaItemCollection.count);
//            
//            player.setQueue(with: mediaItemCollection)
//            player.play()
//            self.updateNowPlayingItem()
//            
//            mediaPicker.dismiss(animated: true, completion: nil)
//        }
//    }
    

//    func displayMediaPickerAndPlayItem(){
//        mediaPicker = MPMediaPickerController(mediaTypes: .anyAudio)
//        
//        if let picker = mediaPicker{
//            print("Successfully instantiated a media picker")
//            picker.delegate = self
//            view.addSubview(picker.view)
//            present(picker, animated: true, completion: nil)
//        } else {
//            print("Could not instantiate a media picker")
//        }
//    }
//    
//    func updateNowPlayingItem(){
//        print (self.myMusicPlayer);
//        if let nowPlayingItem = self.myMusicPlayer!.nowPlayingItem{
//            let nowPlayingTitle=nowPlayingItem.title
//            print(nowPlayingTitle ?? "same");
//        }else{
//            print("nothing played")
//        }
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

func randomInt(max:Int) -> Int {
    return Int(arc4random_uniform(UInt32(max + 1)))
}
