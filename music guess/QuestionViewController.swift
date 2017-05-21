//
//  QuestionViewController.swift
//  music guess
//
//  Created by Kevin Fang on 5/18/17.
//  Copyright © 2017 Kevin Fang. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var chosenIndex = 0;
        
    override func viewDidLoad() {
        super.viewDidLoad()
     
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomInt(max:Int) -> Int {
    return Int(arc4random_uniform(UInt32(max + 1)))
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
