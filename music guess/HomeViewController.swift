//
//  HomeViewController.swift
//  music guess
//
//  Created by Kevin Fang on 5/21/17.
//  Copyright © 2017 Kevin Fang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var chngButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playButton.layer.cornerRadius = 2;
//        playButton.layer.shadowColor = UIColor.black.cgColor
//        playButton.layer.shadowOpacity = 0.7
//        playButton .layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//        playButton.layer.shadowRadius = 10
        
        chngButton.layer.cornerRadius = 2;
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
