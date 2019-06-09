//
//  ChampionCell.swift
//  SwiftUITutorial
//
//  Created by Jason Meulenhoff on 05/06/2019.
//  Copyright © 2019 Jason Meulenhoff. All rights reserved.
//

import SwiftUI

struct ChampionCell: View {
	
	let champion: Champion

	var body: some View {
		HStack {
			
			RemoteImage(urlString: champion.artworkImageString)
				.frame(width: 50, height: 50, alignment: .center)
				.clipShape(Circle())
				.shadow(radius: 1)
				.overlay(Circle().stroke(Color.white, lineWidth: 1))
		
			VStack(alignment: .leading) {
				Text(champion.name).font(.headline)
				HStack {
					Text(champion.title.capitalized).font(.caption)
				}
			}
			
			Spacer()
		}
	}
}

#if DEBUG
struct ChampionCell_Previews : PreviewProvider {
	static var previews: some View {
		ChampionCell(champion: Champion(key: "1", name: "Aatrox", title: "Aatrox", description: "Bad guy"))
	}
}
#endif
