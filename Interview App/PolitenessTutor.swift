//
//  PolitenessTutor.swift
//  Interview App
//
//  Created by Viktar Kalinchuk on 9/26/17.
//  Copyright © 2017 Inteview Sinergy. All rights reserved.
//

import Foundation

// Unit-testing of random access is not a good idea, so that's another example class.
struct PolitenessTutor {

    let notificationCenter: NotificationCenter
    
    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
        
    }

    // Adds ", please" to the and of a request if needed.
    func makeRequestPolite(_ request: String) -> String {
        if request.range(of: "please") != nil {
            return request
        }

        // Assuming, that a request always ends with question mark.
        return request.dropLast() + ", please?"
    }

    // Adds "Hello, " before a name.
    func provideSalutation(_ name: String) -> String {
        return "Hello, \(name)"
    }

    func checkForPoliteness(_ wording: String) -> Bool {
        let hasPlease = wording.range(of: "please") != nil
        let hasSorry = wording.range(of: "sorry") != nil
        let hasWelcome = wording.range(of: "welcome") != nil
        return hasPlease || hasSorry || hasWelcome
    }

    func notifyIfPolite(_ wording: String) {
        if self.checkForPoliteness(wording) {
            notificationCenter.post(name: NSNotification.Name("PolitnessAlert"), object: nil)
        }
    }
}
