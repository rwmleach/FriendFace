//
//  ContentView.swift
//  FriendFace
//
//  Created by Ryan Leach on 12/11/19.
//  Copyright © 2019 Ryan Leach. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	let users: [User] = Bundle.main.decode("friendface.json")
	
	var body: some View {
		NavigationView {
			List(users) { user in
				NavigationLink(destination: UserView(users: self.users, user: user)) {
					UserRow(user: user)
				}
			}.navigationBarTitle("FriendFace")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct UserRow: View {
	let user: User
	
	var body: some View {
		HStack {
			Image(systemName: "person.crop.circle.fill")
				.foregroundColor(self.randomColor())
				.font(.largeTitle)
			VStack(alignment: .leading) {
				Text(user.name).foregroundColor(.primary)
				Text(user.company).foregroundColor(.secondary)
			}
			Spacer()
			Text(user.isActive ? "online" : "").foregroundColor(.green).font(.caption)
		}
	}
	
	func randomColor() -> Color {
		let colors = [Color.red, Color.blue, Color.green, Color.purple, Color.orange]
		let choice = Int.random(in: 0..<colors.count)
		return colors[choice]
	}
}
