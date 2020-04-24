//
//  Quiz2UITests.swift
//  Quiz2UITests
//
//  Created by Balaji on 31/3/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import XCTest
@testable import Quiz2
class Quiz2UITests: XCTestCase {

    override func setUp() {
    
         XCUIApplication().launch()
    }
    
    //checking the answer exists after the answer is clicked
    func testAnswerExists()
    {
        //given
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.staticTexts["Start Quiz"]/*[[".buttons[\"Start Quiz\"].staticTexts[\"Start Quiz\"]",".staticTexts[\"Start Quiz\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["SA"]/*[[".buttons[\"SA\"].staticTexts[\"SA\"]",".staticTexts[\"SA\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Scott Morrison"]/*[[".buttons[\"Scott Morrison\"].staticTexts[\"Scott Morrison\"]",".staticTexts[\"Scott Morrison\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //when
        let kan = app.buttons["Kangaroo"]
            kan.tap()
        
        //then
        XCTAssertFalse(kan.exists)
        app.buttons["Cricket"].tap()
        app.buttons["Melbourne"].tap()
    }
    
    //percentage calculation and in the segue
    func testUIPercentage()
    {
        //given
        let guess = "and secured  100 %"
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.staticTexts["Start Quiz"]/*[[".buttons[\"Start Quiz\"].staticTexts[\"Start Quiz\"]",".staticTexts[\"Start Quiz\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["VIC"]/*[[".buttons[\"VIC\"].staticTexts[\"VIC\"]",".staticTexts[\"VIC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Scott Morrison"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Kangaroo"]/*[[".buttons[\"Kangaroo\"].staticTexts[\"Kangaroo\"]",".staticTexts[\"Kangaroo\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Footy"]/*[[".buttons[\"Footy\"].staticTexts[\"Footy\"]",".staticTexts[\"Footy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Canberra"]/*[[".buttons[\"Canberra\"].staticTexts[\"Canberra\"]",".staticTexts[\"Canberra\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    
        //when
        //let answer = app.staticTexts.element(matching: .any, identifier: "Percentage").label
        let answer = app.staticTexts["Percentage"].label
        
        //then
        XCTAssertEqual(answer, guess, "The score is correct")
    }
    
    //restart valid UI Test
    func testRestartValid()
    {
        //given
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.staticTexts["Start Quiz"]/*[[".buttons[\"Start Quiz\"].staticTexts[\"Start Quiz\"]",".staticTexts[\"Start Quiz\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["VIC"].tap()
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.staticTexts["Scott Morrison"]/*[[".buttons[\"Scott Morrison\"].staticTexts[\"Scott Morrison\"]",".staticTexts[\"Scott Morrison\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.staticTexts["Panda"]/*[[".buttons[\"Panda\"].staticTexts[\"Panda\"]",".staticTexts[\"Panda\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.staticTexts["Cricket"]/*[[".buttons[\"Cricket\"].staticTexts[\"Cricket\"]",".staticTexts[\"Cricket\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Canberra"].tap()
        
        //when
        let restartbut = app2.buttons["Restart the game?"]
            restartbut.tap()
        sleep(2)
        
        //then
        XCTAssertEqual(restartbut.value as! String, "")
    }
}
