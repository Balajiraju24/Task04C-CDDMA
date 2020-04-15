//
//  Quizswiftfile.swift
//  Quiz2
//
//  Created by Balaji on 6/4/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import Foundation

struct Data
{
    let questions: [String]
    let answers: [[String]]
    
    //variables
    var currentquestion: Int
    var rightanswer: UInt32 //the correect answer index
    var points: Int
    var percent: Int
}


var data = Data.init(
    questions: ["In which State are we located ","Who is the Prime Minister of Australia","What is the national animal of Australia","what's the popular game in Australia","what's the capital of Australia"],
    answers: [["VIC","NSW","SA"],["Scott Morrison","Malcolm Turnbull","Tony Abbott"],["Kangaroo","Koala","Panda"],["Footy","Cricket","Tennis"],["Canberra","Melbourne","Sydeny"]],
    currentquestion: 0,
    rightanswer: 0,
    points: 0,
    percent: 0
)
