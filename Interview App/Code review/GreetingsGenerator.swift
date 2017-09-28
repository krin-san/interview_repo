//
//  ReviewGenerator.swift
//  Interview App
//
//  Created by Viktar Kalinchuk on 9/26/17.
//  Copyright © 2017 Inteview Sinergy. All rights reserved.
//

import Foundation

class GeneratedInfo {

    let greeting: String
    let subtitle: String
    let name: String
	
	var fullName: String {
		return subtitle + " " + name
	}

    init(greeting: String, subtitle: String, name: String) {
        self.greeting = greeting
        self.subtitle = subtitle
        self.name = name
    }
}

class GreetingsGenerator {
	
	
	// MARK: - Constants
	private let titles = ["Hello", "Hi", "Welcome", "Wazzap"]
	private let subtitles = ["Mister", "Sir"]
	private let names = ["Bob", "Tom", "Tony", "Adam", "Seed", "Mohammad al Rashid"]

    private let completion: (GeneratedInfo) -> ()

    init (_ completion: @escaping (GeneratedInfo) -> ()) {
        self.completion = completion
    }

    func generate() {
        let item = GeneratedInfo(greeting: generateTitle(), subtitle: generateSubtitles(), name: generateNames())
        completion(item)
    }

    private func generateTitle() -> String {
        return titles.getRandom()
    }

    private func generateSubtitles() -> String {
        return subtitles.getRandom()
    }

    private func generateNames() -> String {
        return names.getRandom()
    }
}

