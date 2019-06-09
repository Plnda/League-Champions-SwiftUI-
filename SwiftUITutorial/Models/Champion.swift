//
//  Champion.swift
//  SwiftUITutorial
//
//  Created by Jason Meulenhoff on 07/06/2019.
//  Copyright © 2019 Jason Meulenhoff. All rights reserved.
//

import Foundation
import SwiftUI

struct Champion: Decodable, Hashable, Identifiable {
	
	enum CodingKeys: String, CodingKey {
		case id
		case key
		case name
		case title
		case description = "blurb"
	}
	
	let id: UUID = UUID()
	let key: String
	let name: String
	let title: String
	let description: String

	var artworkImageString: String {
		return "https://ddragon.leagueoflegends.com/cdn/6.24.1/img/champion/\(name).png"
	}
	
	var splashImageString: String {
		return "https://ddragon.leagueoflegends.com/cdn/img/champion/loading/\(name)_0.jpg"
	}
}
