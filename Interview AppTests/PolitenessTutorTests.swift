//
//  PolitenessTutorTests.swift
//  Interview AppTests
//
//  Created by Viktar Kalinchuk on 9/26/17.
//  Copyright © 2017 Inteview Sinergy. All rights reserved.
//

import XCTest
@testable import Interview_App

class PolitenessTutorTests: XCTestCase {
    
    func testMakeRequestPoliteAlreadyHasPlease() {
        let tutor = PolitenessTutor()
        let result = tutor.makeRequestPolite("Can I see more test, please?")
        XCTAssertEqual(result, "Can I see more test, please?")
    }
    
}
