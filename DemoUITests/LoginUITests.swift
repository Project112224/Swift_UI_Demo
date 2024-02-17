//
//  DemoUITests.swift
//  DemoUITests
//
//  Created by --- on 2024/2/6.
//

import XCTest

final class LoginUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExists() throws {
        let app = XCUIApplication()
        app.launch()
        
        let accountTextField = app.textFields["Account"]
        let pwTextField = app.secureTextFields["Password"]
        let loginButton = app.buttons["LOGIN"]
        
        XCTAssert(accountTextField.exists)
        XCTAssert(pwTextField.exists)
        XCTAssert(loginButton.exists)
    }
    
    func testEmpty() throws {
        let app = XCUIApplication()
        app.launch()
        let accountTextField = app.textFields["Account"]
        let pwTextField = app.secureTextFields["Password"]
        let loginButton = app.buttons["LOGIN"]
        
        // 帳號密碼空值
        loginButton.tap()
        sleep(1)
        let alertButton = app.buttons["OK"]
        alertButton.tap()
        
        // 密碼空值
        accountTextField.tap()
        accountTextField.typeText("asdas")
        loginButton.tap()
        sleep(1)
        alertButton.tap()
        
        accountTextField.tap()
        accountTextField.clearText()
        
        // 帳號空值
        pwTextField.tap()
        pwTextField.typeText("zxczxz")
        loginButton.tap()
        sleep(1)
        alertButton.tap()
    }
    
    /// 帳號
    func testValidAccount() throws {
        let app = XCUIApplication()
        app.launch()
        
        let accountTextField = app.textFields["Account"]
        let pwTextField = app.secureTextFields["Password"]
        let loginButton = app.buttons["LOGIN"]
        
        pwTextField.tap()
        pwTextField.typeText("Asd1234567")
        
        // 隨意英文數字
        accountTextField.tap()
        accountTextField.typeText("a123")
        loginButton.tap()
        sleep(1)
        let alertButton = app.buttons["OK"]
        alertButton.tap()
        
        // 超出字數
        accountTextField.tap()
        accountTextField.clearText()
        accountTextField.typeText("A123456789")
        loginButton.tap()
        sleep(1)
        alertButton.tap()
        
        // 大小寫
        accountTextField.tap()
        accountTextField.clearText()
        accountTextField.typeText("a123456789")
        loginButton.tap()
        sleep(1)
        alertButton.tap()
        
        // 正確
        accountTextField.tap()
        accountTextField.clearText()
        accountTextField.typeText("A12345678")
        loginButton.tap()
        sleep(1)
    }
    
    /// 密碼
    func testValidPassword() throws {
        let app = XCUIApplication()
        app.launch()
        
        let accountTextField = app.textFields["Account"]
        accountTextField.tap()
        accountTextField.typeText("A12345678")
        
        let pwTextField = app.secureTextFields["Password"]
        let loginButton = app.buttons["LOGIN"]
        
        // 少英文
        pwTextField.tap()
        pwTextField.typeText("12345678")
        pwTextField.typeText("\n")
        loginButton.tap()
        sleep(1)
        let alertButton = app.buttons["OK"]
        alertButton.tap()
        
        // 少數字
        pwTextField.tap()
        pwTextField.clearText()
        pwTextField.typeText("asdfsfghfhfgh")
        pwTextField.typeText("\n")
        loginButton.tap()
        sleep(1)
        alertButton.tap()
        
        // 英文小寫
        pwTextField.tap()
        pwTextField.clearText()
        pwTextField.typeText("ASD12312121")
        pwTextField.typeText("\n")
        loginButton.tap()
        sleep(1)
        alertButton.tap()
        
        // 英文小寫
        pwTextField.tap()
        pwTextField.clearText()
        pwTextField.typeText("asda12312121")
        pwTextField.typeText("\n")
        loginButton.tap()
        sleep(1)
        alertButton.tap()
        
        // 字數
        pwTextField.tap()
        pwTextField.clearText()
        pwTextField.typeText("a123")
        pwTextField.typeText("\n")
        loginButton.tap()
        sleep(1)
        alertButton.tap()
        
        // 正確
        pwTextField.tap()
        pwTextField.clearText()
        pwTextField.typeText("aA12345678")
        pwTextField.typeText("\n")
        loginButton.tap()
        sleep(1)
    }
    
    
    func testFiveErrorMessage() {
        let app = XCUIApplication()
        app.launch()
        
        let loginButton = app.buttons["LOGIN"]
        
        loginButton.tap()
        sleep(1)
        let alertButton = app.buttons["OK"]
        for _ in 0...4 {
            loginButton.tap()
            sleep(1)
            alertButton.tap()
            sleep(1)
        }
    }
    
    func testToHomePage() {
        let app = XCUIApplication()
        app.launch()
        
        let accountTextField = app.textFields["Account"]
        let pwTextField = app.secureTextFields["Password"]
        let loginButton = app.buttons["LOGIN"]
        
        accountTextField.tap()
        accountTextField.typeText("A12345678")

        pwTextField.tap()
        pwTextField.typeText("a12345678")
        pwTextField.typeText("\n")

        loginButton.tap()
        sleep(1)
    }
    
}

extension XCUIElement {
    func clearText() {
        guard let stringValue = self.value as? String else {
            return
        }
        // workaround for apple bug
        if let placeholderString = self.placeholderValue, placeholderString == stringValue {
            return
        }

        var deleteString = String()
        for _ in stringValue {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        typeText(deleteString)
    }
}
