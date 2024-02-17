//
//  DemoUITests.swift
//  DemoUITests
//
//  Created by --- on 2024/2/6.
//

import XCTest

final class HomeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testEmpty() throws {
        let app = XCUIApplication()
        app.launch()
        
        let accountTextField = app.textFields["Account"]
        let pwTextField = app.secureTextFields["Password"]
        let loginButton = app.buttons["LOGIN"]
        
        accountTextField.tap()
        accountTextField.typeText("A12345678")
        
        pwTextField.tap()
        pwTextField.typeText("bA1231213121")
        pwTextField.typeText("\n")
        
        loginButton.tap()
        sleep(1)
        
        // 首頁
        let projectSwitch = app.buttons["代辦事項"]
        projectSwitch.tap()
        let accessSwitch = app.buttons["我的約訪"]
        accessSwitch.tap()
        
        let tableSwitch = app.buttons["數據表"]
        tableSwitch.tap()
        let chartSwitch = app.buttons["走勢圖"]
        chartSwitch.tap()
        
        let dateLeftButton = app.buttons.matching(identifier: "date_left").firstMatch
        dateLeftButton.tap()
        
        let dateRightButton = app.buttons.matching(identifier: "date_right").firstMatch
        dateRightButton.tap()
        
        let datePickers = app.datePickers.firstMatch
        datePickers.tap()
        app.swipeUp()
        
//        let monthPicker = app.pickers.firstMatch
//        monthPicker.tap()
        
        sleep(1)
    }
    
    
}
