//
//  ChampionDetailView.swift
//  SwiftUITutorial
//
//  Created by Jason Meulenhoff on 08/06/2019.
//  Copyright © 2019 Jason Meulenhoff. All rights reserved.
//

import Foundation
import SwiftUI

struct ChampionDetailView : View {

	@State
	var champion: Champion
	
	var body: some View {
		VStack {
			ZStack {
				RemoteImage(urlString: champion.splashImageString)
				Text(champion.name)
			}
			Spacer()
		}
		
	}
}

#if DEBUG
struct ChampionDetailView_Previews : PreviewProvider {
	static var previews: some View {
		ChampionDetailView(champion: Champion(key: "1", name: "Aatrox", title: "Title", description: "Description"))
	}
}
#endif
