//
//  ViewController.swift
//  Quiz2
//
//  Created by Balaji on 31/3/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
    //lable
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    
    //button
    @IBAction func action(_ sender: AnyObject) {
        if (sender.tag == Int(data.rightanswer))
        {
            data.points += 1
        }
        else{
            //print("Wrong")
        }
        
        if (data.currentquestion != data.questions.count)
        {
            newquestion(currentQuestionIndex: data.currentquestion)
        }
        else
        {
            data.percent = percentage(score: data.points)
            performSegue(withIdentifier: "result", sender: self)
            //perform segue to go next view controller
        }
    }
    
    //override function for the view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! resultViewController
        vc.finalmark = "\(data.points)"
        //print(percent)
        vc.percentage = "\(data.percent)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newquestion(currentQuestionIndex: data.currentquestion)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.currentquestion = 0
        data.rightanswer = 0 //the correect answer index
        data.points = 0
        data.percent = 0
        // Do any additional setup after loading the view.
    }
    
    //function that displays new questions
    func newquestion(currentQuestionIndex: Int)
    {
        //n += 1
        lbl.text = data.questions[currentQuestionIndex]
        //data.rightanswer = arc4random_uniform(3)+1        
        //pts.text = "score will display at the end of questions"
        //create button
        data.rightanswer = 3
        var button:UIButton = UIButton()
        //print ("\(rightanswer)")
        var x = 1
        text.text = "Question \(currentQuestionIndex + 1) /5"
        for i in 1...3
        {
            //create button
            button=view.viewWithTag(i) as! UIButton
             if(i == Int(data.rightanswer))
             {
                button.setTitle(data.answers[currentQuestionIndex][0], for: .normal)
             }
            else
             {
                button.setTitle(data.answers[currentQuestionIndex][x], for: .normal)
                x = 2
            }
        }
           data.currentquestion += 1
       // return points
    }
    
    func percentage(score: Int) -> Int
    {
        data.percent = (score * 200 + data.questions.count) / (2 * data.questions.count)
        print(data.percent)
        return data.percent
    }
    
    
}






