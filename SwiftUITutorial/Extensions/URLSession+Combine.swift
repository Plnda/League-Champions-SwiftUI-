//
//  URLSession.swift
//  SwiftUITutorial
//
//  Created by Jason Meulenhoff on 07/06/2019.
//  Copyright © 2019 Jason Meulenhoff. All rights reserved.
//

import Foundation
import Combine

extension URLSession {
	
	func request(url: URL) -> AnyPublisher<Data, Error> {
		
		// Create an observable
		return .init { subscriber in
			
			// Create a data task
			let task = self.dataTask(with: url) { data, response, error in
				
				// Call on main queue
				DispatchQueue.main.async {
					
					// Make sure we have a valid response
					guard let response = response as? HTTPURLResponse, let data = data, (200..<300) ~= response.statusCode else {
						
						// If we have an error we let the subscibers know
						if let error = error {
							subscriber.receive(completion: .failure(error))
						}
						
						return
					}
					
					// todo: Handle demand?
					_ = subscriber.receive(data)
					
					// Signal that we are done
					subscriber.receive(completion: .finished)
				}
			}
			
			task.resume()
		}
	}
}

extension JSONDecoder: TopLevelDecoder {}
