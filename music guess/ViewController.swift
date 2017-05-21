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
    var myMusicPlayer: MPMusicPlayerController?
    var nowPlaying: MPMediaItem?

    @IBOutlet weak var question: UIImageView!
    
    @IBAction func one(_ sender: Any) {
    }
    @IBAction func two(_ sender: Any) {
    }
    @IBAction func three(_ sender: Any) {
    }
    @IBAction func four(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        question.layer.cornerRadius = question.frame.size.width/2 - 0;
        let mediaItems = MPMediaQuery.songs().items

        let mediaCollection = MPMediaItemCollection(items: mediaItems!)
        
        let player = MPMusicPlayerController.systemMusicPlayer()
        nowPlaying = player.nowPlayingItem
        print(nowPlaying?.title);
        
        player.setQueue(with: mediaCollection)
        player.play()
        
        let when = DispatchTime.now() + 6
        DispatchQueue.main.asyncAfter(deadline: when) {
            player.stop();
        }
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
