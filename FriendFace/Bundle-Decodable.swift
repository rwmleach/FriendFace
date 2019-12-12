//
//  Bundle-Decodable.swift
//  FriendFace
//
//  Created by Ryan Leach on 12/11/19.
//  Copyright © 2019 Ryan Leach. All rights reserved.
//

import Foundation

extension Bundle {
	func decode<T: Codable>(_ file: String) -> T {
		guard let url = self.url(forResource: file, withExtension: nil) else {
			fatalError("Failed to locate \(file) in bundle.")
		}
		
		guard let data = try? Data(contentsOf: url) else {
			fatalError("Failed to load \(file) from bundle")
		}
		
		let decoder = JSONDecoder()
		
		guard let loaded = try? decoder.decode(T.self, from: data) else {
			fatalError("Failed to decode \(file) from bunde.")
		}
		
		return loaded
	}
}
