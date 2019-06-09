//
//  ChampionListView.swift
//  SwiftUITutorial
//
//  Created by Jason Meulenhoff on 05/06/2019.
//  Copyright © 2019 Jason Meulenhoff. All rights reserved.
//

import Foundation
import SwiftUI

struct ChampionListView : View {

	@ObjectBinding
	var viewModel: ChampionsListViewModel
	
	var body: some View {
		NavigationView {
			List(viewModel.champions) { champion in
				NavigationButton(destination: ChampionDetailView(champion: champion)) {
					ChampionCell(champion: champion)
				}
			}
			.navigationBarTitle(Text("Champions"))
		}
	}
}

#if DEBUG
struct ChampionListView_Previews : PreviewProvider {
	static var previews: some View {
		ChampionListView(viewModel: ChampionsListViewModel())
	}
}
#endif

