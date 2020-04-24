//
//  ViewController.swift
//  Quiz2
//
//  Created by Balaji on 31/3/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    //label
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    
    var quizData = QuizData()
    
    //button
    @IBAction func action(_ sender: AnyObject) {
        if (sender.tag == Int(quizData.getRightAnswer()))
        {
            quizData.incrementPoints()
        }
        if (quizData.getCurrentQuestion() != quizData.getQuestions().count)
        {
            newquestion(currentQuestionIndex: quizData.getCurrentQuestion())
        }
        else
        {
            quizData.calculatePercentage(points: quizData.getPoints())
            performSegue(withIdentifier: "result", sender: self)
            //perform segue to go next view controller
        }
    }
    
    //override function for the view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! resultViewController
        vc.finalmark = "\(quizData.getPoints())"
        vc.percentage = "\(quizData.getPercent())"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newquestion(currentQuestionIndex: quizData.getCurrentQuestion())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //function that displays new questions
    func newquestion(currentQuestionIndex: Int)
    {
        lbl.text = quizData.getQuestions()[currentQuestionIndex]
        //create button
        quizData.setRightAnswer(number: 3)
        var button:UIButton = UIButton()
        var x = 1
        text.text = "Question \(currentQuestionIndex + 1) /5"
        for i in 1...3
        {
            //create button
            button=view.viewWithTag(i) as! UIButton
             if(i == Int(quizData.getRightAnswer()))
             {
                button.setTitle(quizData.getAnswers()[currentQuestionIndex][0], for: .normal)
             }
            else
             {
                button.setTitle(quizData.getAnswers()[currentQuestionIndex][x], for: .normal)
                x = 2
            }
        }
        quizData.incrementCurrentQuestion()
    }
}






