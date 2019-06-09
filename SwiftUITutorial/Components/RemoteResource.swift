//
//  RemoteImage.swift
//  SwiftUITutorial
//
//  Created by Jason Meulenhoff on 07/06/2019.
//  Copyright © 2019 Jason Meulenhoff. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class RemoteResource: BindableObject {
	
	let didChange = PassthroughSubject<Void, Never>()

	// The subscription
	var subscription: Subscribers.Sink<AnyPublisher<Data, Error>>?
	
	var data: Data? {
		didSet {
			didChange.send(Void())
		}
	}
	
	init(_ urlString: String) {
		
		// Create an url
		guard let url = URL(string: urlString) else {
			return
		}
		
		// Subscribe to our observer
		let subscription = URLSession.shared.request(url: url)
			.sink(receiveValue: { [weak self] in
			
				// Set the data
				self?.data = $0
		})
		
		// Save the subscription
		self.subscription = subscription
	}
	
	deinit {
		
		// When this view is destroyed cancel the subscription
		subscription?.cancel()
	}
}
