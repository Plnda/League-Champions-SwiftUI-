//
//  API.swift
//  SwiftUITutorial
//
//  Created by Jason Meulenhoff on 07/06/2019.
//  Copyright © 2019 Jason Meulenhoff. All rights reserved.
//

import Foundation
import Combine

protocol RequestManager {
	func response<T>(for path: URL) -> AnyPublisher<T, Error> where T: Decodable
}

extension RequestManager {
	
	func response<T>(for path: URL) -> AnyPublisher<T, Error> where T: Decodable {
		
		URLSession.shared.request(url: path)
			.flatMap { Publishers.Just($0).decode(type: T.self, decoder: JSONDecoder()) }
			.eraseToAnyPublisher()
	}
}

struct DefaultRequestManager: RequestManager { }

struct LeagueAPI {
	
	let requestManager: RequestManager
	
	init(requestManager: RequestManager = DefaultRequestManager()) {
		self.requestManager = requestManager
	}
	
	func getChampions() -> AnyPublisher<[Champion], Error> {
		
		struct Response: Decodable {
			let data: [String: Champion]
		}
		
		return (requestManager.response(for: URL(string: "https://ddragon.leagueoflegends.com/cdn/6.24.1/data/en_US/champion.json")!) as AnyPublisher<Response, Error>)
			.map {
				$0.data.map({ return $1 })
			}
			.eraseToAnyPublisher()
	}
}
