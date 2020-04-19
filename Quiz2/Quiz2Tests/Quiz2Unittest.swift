//
//  Quiz2Unittest.swift
//  Quiz2Tests
//
//  Created by Balaji on 9/4/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import XCTest
@testable import Quiz2

class Quiz2Unittest: XCTestCase {
    
    var vct: ViewController?
    
    override func setUp()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Quiz") as! ViewController
        vct = vc
        let _ = vc.view
    }
    
    func testQuizScoreIsCalculated()
    {
        print()
        if let vctesting = vct
        {
            let index = data.currentquestion + 1
            //1. given
        
            let guess = data.points + 1
            //2. when
        
            vctesting.newquestion(currentQuestionIndex: index)
            vctesting.action(vctesting.answerButton3)
        
            //3. then
        
            XCTAssertEqual(data.points, guess, "Score calculated from guess is correct")
        }
    }
    
    func testQuizPercentageIsCalculated()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Quiz") as! ViewController
        let _ = vc.view
        //1. given
        
        let guess = 20
        let index = data.currentquestion + 1
        
        //2. when
        vc.newquestion(currentQuestionIndex: index)
        vc.action(vc.answerButton3)
        vc.percentage(score: data.points)
        
        //3. then
        XCTAssertEqual(data.percent, guess, "Percentage calculated from guess is correct")
    }
    
    func testQuizAnswerChoiceIsShown()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Quiz") as! ViewController
        let _ = vc.view
        
        //1. given
        let guess = "Scott Morrison"
        let index = data.currentquestion + 1
        
        //2. when
        vc.newquestion(currentQuestionIndex: index)
        
        //3. then
        XCTAssertEqual(vc.answerButton3.currentTitle, guess, "Answer choice from guess is correct")
    }
    
    func testQuizDisplaysQuestion()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Quiz") as! ViewController
        let _ = vc.view
        //1. given
        
        let guess = "Who is the Prime Minister of Australia"
        let index = data.currentquestion + 1
        //2. when
        
        vc.newquestion(currentQuestionIndex: index)
        
        //3. then
        
        XCTAssertEqual(vc.lbl.text, guess, "Question from guess is correct")
        
    }
}

