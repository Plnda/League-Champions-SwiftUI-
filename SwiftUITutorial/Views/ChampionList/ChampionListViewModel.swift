//
//  ChampionViewModel.swift
//  SwiftUITutorial
//
//  Created by Jason Meulenhoff on 08/06/2019.
//  Copyright © 2019 Jason Meulenhoff. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ChampionsListViewModel: BindableObject {
	
	var didChange = PassthroughSubject<Void, Never>()

	private(set) var champions: [Champion] = [] {
		didSet {
			didChange.send(Void())
		}
	}
	
	private let api: LeagueAPI
	
	init(with api: LeagueAPI = LeagueAPI()) {
		self.api = api
		
		fetch()
	}
	
	func fetch() {

		_ = api.getChampions().sink { [weak self] champions in
			self?.champions = champions.sorted(by: { $0.name < $1.name })
		}
	}
}
