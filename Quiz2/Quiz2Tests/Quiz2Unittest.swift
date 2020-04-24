//
//  Quiz2Unittest.swift
//  Quiz2Tests
//
//  Created by Balaji on 9/4/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import XCTest
@testable import Quiz2

var quizData: QuizData!

class Quiz2Unittest: XCTestCase {
    
    override func setUp()
    {
        super.setUp()
        quizData = QuizData()
    }
    
    override func tearDown() {
        quizData = nil
        super.tearDown()
    }
    
    //test case for calculating the percentage
    func testQuizPercentageIsCalculated()
    {
        //1. given
        let guess = quizData.getPercent() + 20
        
        //2. when
        quizData.calculatePercentage(points: 1)
        
        //3. then
        XCTAssertEqual(quizData.getPercent(), guess, "Percentage calculated from guess is correct")
    }
    
    //showing correct answer for that specific questions in the given block
    func testQuizAnswerChoiceIsShown()
    {
        //1. given
        let question = "what's the capital of Australia"
        let index = quizData.getQuestions().firstIndex(of: question)
        let guess = ["Canberra","Melbourne","Sydeny"]
        
        //2. when
        let answers: [String] = quizData.getAnswers()[index!]
        
        //3. then
        XCTAssertEqual(answers, guess, "Answer choice from guess is correct")
    }
    
    //guessing the right answer for that sepcific question
    func testQuizRightAnswer()
    {
        //1. given
        let question = "Who is the Prime Minister of Australia"
        let index = quizData.getQuestions().firstIndex(of: question)
        let guess = "Scott Morrison"
        
        //2. when
        let answer = quizData.getAnswers()[index!][0]
        
        //3. then
        XCTAssertEqual(answer, guess, "Question from guess is correct")
        
    }
}

