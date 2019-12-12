//
//  UserView.swift
//  FriendFace
//
//  Created by Ryan Leach on 12/11/19.
//  Copyright © 2019 Ryan Leach. All rights reserved.
//

import SwiftUI

struct UserView: View {
	let users: [User]
	let user: User
	let friends: [User]
	
    var body: some View {
		Form {
			Section {
				HStack {
					Text("Company: ").foregroundColor(.secondary)
					Text(user.company)
				}
				Text(user.email)
				Text(user.address)
			}
			
			Section(header: Text("About")) {
				Text(user.about)
			}
			
			Section(header: Text("Friends")) {
				ForEach(friends, id: \.id) { friend in
					NavigationLink(destination: UserView(users: self.users, user: friend)) {
						UserRow(user: friend)
					}
				}
			}
			
			Section(header: Text("Tags")) {
				ForEach(user.tags, id: \.self) { tag in
					Text("#\(tag)")
				}.foregroundColor(.secondary)
			}
			
		}.navigationBarTitle(user.name)
        
    }
	
	init(users: [User], user: User) {
		self.users = users
		self.user = user
		
		var matches = [User]()
		
		for friend in user.friends {
			for user in users {
				if friend.id == user.id {
					matches.append(user)
				}
			}
		}
		
		self.friends = matches
	}
	
}

struct UserView_Previews: PreviewProvider {
	static let users: [User] = Bundle.main.decode("friendface.json")
	
    static var previews: some View {
		UserView(users: users, user: users[0])
    }
}


//let id: String
//let isActive: Bool
//let name: String
//let age: Int
//let company: String
//let email: String
//let address: String
//let about: String
//let registered: String
//let tags: [String]
//let friends: [Friend]
