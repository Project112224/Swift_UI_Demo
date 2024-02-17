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
        XCTAssert(accountTextField.exists)
        let pwTextField = app.secureTextFields["Password"]
        XCTAssert(pwTextField.exists)
        let loginButton = app.buttons["LOGIN"]
        XCTAssert(loginButton.exists)
        
        loginButton.tap()
        sleep(2)
        
        accountTextField.tap()
        accountTextField.typeText("b")
        accountTextField.typeText("\n")
        
        loginButton.tap()
        sleep(1)
        
        pwTextField.tap()
        pwTextField.typeText("b")
        pwTextField.typeText("\n")
        
        loginButton.tap()
        sleep(2)
        
        let alertButton = app.buttons["OK"]
        XCTAssert(alertButton.exists)
        alertButton.tap()
        sleep(2)
    }
    
    
}
