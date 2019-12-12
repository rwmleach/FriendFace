//
//  User.swift
//  FriendFace
//
//  Created by Ryan Leach on 12/11/19.
//  Copyright © 2019 Ryan Leach. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {	
	struct Friend: Codable {
		let id: String
		let name: String
	}

	let id: String
	let isActive: Bool
	let name: String
	let age: Int
	let company: String
	let email: String
	let address: String
	let about: String
	let registered: String
	let tags: [String]
	let friends: [Friend]
}
