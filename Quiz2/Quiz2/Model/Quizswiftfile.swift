//
//  Quizswiftfile.swift
//  Quiz2
//
//  Created by Balaji on 6/4/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import Foundation

struct QuizData
{
    let questions: [String] = ["In which State are we located ","Who is the Prime Minister of Australia","What is the national animal of Australia","what's the popular game in Australia","what's the capital of Australia"]
    let answers: [[String]] = [["VIC","NSW","SA"],["Scott Morrison","Malcolm Turnbull","Tony Abbott"],["Kangaroo","Koala","Panda"],["Footy","Cricket","Tennis"],["Canberra","Melbourne","Sydeny"]]
    
    //variables
    var currentquestion: Int = 0
    var rightanswer: UInt32 = 0//the correect answer index
    var points: Int = 0
    var percent: Int = 0
    
    //functions for the variables
    func getQuestions()->[String]
    {
        return questions
    }
    
    func getAnswers()->[[String]]
    {
        return answers
    }
    
    func getCurrentQuestion()->Int
    {
        return currentquestion
    }
    
    mutating func incrementCurrentQuestion()
    {
        currentquestion += 1
    }
    
    func getRightAnswer()->UInt32
    {
        return rightanswer
    }
    
    mutating func setRightAnswer(number: UInt32)
    {
        rightanswer = number
    }
    
    func getPoints()->Int
    {
        return points
    }
    
    mutating func incrementPoints()
    {
        points += 1
    }
    
    func getPercent()->Int
    {
        return percent
    }
    
    mutating func setPercent(percent: Int)
    {
        self.percent = percent
    }
    
    //function to calculate the percentage of the total score
    mutating func calculatePercentage(points: Int)
    {
        percent = (points * 200 + getQuestions().count) / (2 * getQuestions().count)
    }
}
