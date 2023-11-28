//
//  LocationSearchMapResults.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/6/23.
//

import SwiftUI

struct LocationSearchMapResults: View {
  @EnvironmentObject var viewModel: LocationSearchViewModel
  @Binding var appState: AppState
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        ForEach(viewModel.results, id: \.self) { result in
          LocationSearchMapResultsCell(name: result.title, address: result.subtitle)
            .onTapGesture {
              withAnimation(.spring()) {
                viewModel.selectLocation(result)
                appState = .locationSelected
              }
            }
        }
      }
    }
  }
}

struct LocationSearchMapResults_Previews: PreviewProvider {
	static var locationSearch: LocationSearchViewModel {
		let viewModel = LocationSearchViewModel()
		viewModel.queryFragment = "Fo"
		return viewModel
	}
	
  static var previews: some View {
    LocationSearchMapResults(appState: .constant(.idle))
			.environmentObject(locationSearch)
  }
}
