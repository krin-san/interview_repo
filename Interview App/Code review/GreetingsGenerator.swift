//
//  ReviewGenerator.swift
//  Interview App
//
//  Created by Viktar Kalinchuk on 9/26/17.
//  Copyright © 2017 Inteview Sinergy. All rights reserved.
//

import Foundation

class GeneratedInfo {

    let title: String
    let subtitlePart1: String
    let subtitlePart2: String

    init(title: String, subtitlePart1: String, subtitlePart2: String) {
        self.title = title
        self.subtitlePart1 = subtitlePart1
        self.subtitlePart2 = subtitlePart2
    }
}

class GreetingsGenerator {

    private let completion: (GeneratedInfo) -> ()

    init (_ completion: @escaping (GeneratedInfo) -> ()) {
        self.completion = completion
    }

    func generate() {
        let item = GeneratedInfo(title: generateTitle(), subtitlePart1: generateSubtitlePart1(), subtitlePart2: generateSubtitlePart2())
        completion(item)
    }

    private func generateTitle() -> String {
        let titles = ["Hello", "Hi", "Welcome", "Wazzap"]
        // Get a random number for an any array item.
        let index = Int(arc4random_uniform(4))
        return titles[index]
    }

    private func generateSubtitlePart1() -> String {
        let subtitles1 = ["Mister", "Sir"]
        // Get a random number for an any array item.
        let index = Int(arc4random_uniform(2))
        return subtitles1[index]
    }

    private func generateSubtitlePart2() -> String {
        return ["Bob", "Tom", "Tony", "Adam", "Seed", "Mohammad al Rashid"].getRandom()
    }
}

extension Array {
    
    func getRandom() -> Element {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
    
}
