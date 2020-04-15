//
//  resultViewController.swift
//  Quiz2
//
//  Created by Balaji on 31/3/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {
    @IBOutlet weak var poin: UILabel!
    @IBOutlet weak var perc: UILabel!
    var finalmark = ""
     var percentage = ""
    
    @IBOutlet weak var restart: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if (Int(finalmark) == 5)
        {
        poin.text = "Congratulations!!... You have scored \(finalmark) / 5"
        print(finalmark)
        }
        else{
            poin.text = "You have scored \(finalmark) / 5"
            print(finalmark)
        }
        
        if (Int(percentage) == 100)
        {
            perc.text = "and secured  \(percentage) %"
            print(percentage)
        }
        else{
            
            perc.text = "percentage secured is \(percentage)"
            print(percentage)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func restartquiz(_ sender: Any) {
        performSegue(withIdentifier: "restartquiz", sender: nil)
    }
    
    

}
