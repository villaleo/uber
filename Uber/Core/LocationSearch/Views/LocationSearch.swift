//
//  LocationSearch.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/20/23.
//

import SwiftUI

// MARK: - LocationSearch

struct LocationSearch: View {
  
  @EnvironmentObject var viewModel: LocationSearchViewModel
  @Binding var mapState: MapState
  
  var body: some View {
    VStack {
      HStack {
        Waypoint()
          .padding(.trailing, 8)
        LocationSearchLocationInput()
      }
      .padding(.top, 80)
      .padding(.horizontal)
      
      Divider()
        .padding(.top, 8)
        .padding(.horizontal)
      LocationSearchMapResults(mapState: $mapState)
    }
    .background(Color.theme.backgroundColor)
  }
  
}

// MARK: - LocationSearch_Previews

struct LocationSearch_Previews: PreviewProvider {
  
  static var previews: some View {
    LocationSearch(mapState: .constant(.searchingForLocation))
      .environmentObject(LocationSearchViewModel())
  }
  
}
