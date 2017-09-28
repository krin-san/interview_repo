//
//  Array+GetRandom.swift
//  Interview App
//
//  Created by Aleksandr Kundelev on 28/09/2017.
//  Copyright © 2017 Inteview Sinergy. All rights reserved.
//

import Foundation


extension Array {
	func getRandom() -> Element {
		return self[Int(arc4random_uniform(UInt32(self.count)))]
	}
}
