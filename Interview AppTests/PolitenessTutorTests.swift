//
//  PolitenessTutorTests.swift
//  Interview AppTests
//
//  Created by Viktar Kalinchuk on 9/26/17.
//  Copyright © 2017 Inteview Sinergy. All rights reserved.
//

import XCTest
@testable import Interview_App

class TestNotificationCenter: NotificationCenter {
    
    var notificationWasPost: Bool = false
    var notificationType: NSNotification.Name?
    
    override func post(name aName: NSNotification.Name, object anObject: Any?) {
        self.notificationWasPost = true
        notificationType = aName
    }
    
}

class PolitenessTutorTests: XCTestCase {
    
    func testMakeRequestPoliteAlreadyHasPlease() {
        let tutor = PolitenessTutor()
        let result = tutor.makeRequestPolite("Can I see more test, please?")
        XCTAssertEqual(result, "Can I see more test, please?")
    }
    
    func testMakeRequestPoliteHasNoPlease() {
        let tutor = PolitenessTutor()
        let result = tutor.makeRequestPolite("Can I see more test?")
        XCTAssertEqual(result, "Can I see more test, please?")
    }
    
    func testSolutationCorrent() {
        let tutor = PolitenessTutor()
        let result = tutor.provideSalutation("Alex")
        XCTAssertEqual(result, "Hello, Alex")
    }
    
    func testCheckForPolitnessPleaseExists() {
        let tutor = PolitenessTutor()
        let result = tutor.checkForPoliteness("You should say please.")
        XCTAssertTrue(result)
    }
    
    func testCheckForPolitnessSorryExists() {
        let tutor = PolitenessTutor()
        let result = tutor.checkForPoliteness("I so sorry for being late!")
        XCTAssertTrue(result)
    }
    
    func testCheckForPolitnessWelcomeExists() {
        let tutor = PolitenessTutor()
        let result = tutor.checkForPoliteness("I'd like to welcome you.")
        XCTAssertTrue(result)
    }
    
    func testCheckForPolitnessDoesntExist() {
        let tutor = PolitenessTutor()
        let result = tutor.checkForPoliteness("Welcome, Jack!")
        XCTAssertFalse(result)
    }
    
    func testNotifyPolite() {
        let notifictionCenter = TestNotificationCenter()
        let tutor = PolitenessTutor(notificationCenter: notifictionCenter)
        tutor.notifyIfPolite("please provide usefull information")
        XCTAssertTrue(notifictionCenter.notificationWasPost)
        XCTAssertEqual(notifictionCenter.notificationType?._rawValue, "PolitnessAlert")
    }
}
