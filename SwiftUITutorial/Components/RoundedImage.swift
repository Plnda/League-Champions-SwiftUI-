//
//  RoundedImage.swift
//  SwiftUITutorial
//
//  Created by Jason Meulenhoff on 05/06/2019.
//  Copyright © 2019 Jason Meulenhoff. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct RoundedImage : View {
	
	// Hold reference to our remote resource through binding
	@ObjectBinding
	private var resource: RemoteResource
	
	// Initialize the Image with a string
	init(urlString: String) {
		
		// Create our resource and request our data
		// Will fetch the resource from the internet
		self.resource = RemoteResource(urlString)
	}
	
	// Computed var that will return a placeholder image our our actual resource
	var image: UIImage {
		self.resource.data.flatMap(UIImage.init) ?? UIImage(named: "placeholder")!
	}
	
	var body: some View {
		
		Image(uiImage: image)
			.resizable()
			.scaledToFit()
			.frame(width: 50, height: 50, alignment: .center)
			.clipShape(Circle())
			.shadow(radius: 1)
			.overlay(Circle().stroke(Color.white, lineWidth: 1))
	}
}

#if DEBUG
struct RoundedImage_Previews : PreviewProvider {
	static var previews: some View {
		RoundedImage(urlString: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=2ahUKEwjGzvvmvtniAhURPVAKHZCIAHQQjRx6BAgBEAU&url=http%3A%2F%2Fwww.stleos.uq.edu.au%2Flive-on-campus%2Faccommodation%2Fimage-placeholder%2F&psig=AOvVaw16nMzp9If9zCG7aCrGA00P&ust=1560069736947583")
	}
}
#endif
