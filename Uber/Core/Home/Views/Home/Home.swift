//
//  Home.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/19/23.
//

import SwiftUI

// MARK: - Home

struct Home: View {
  
  @EnvironmentObject var locationViewModel: LocationSearchViewModel
  @State private var mapState = MapState.default

  var body: some View {
    ZStack {
      ZStack(alignment: .top) {
				HomeSideMenu()
					.ignoresSafeArea()
				
        Map(mapState: $mapState)
					.shadow(radius: 8)
          .ignoresSafeArea()
					.offset(mapState == .showingSideMenu ? .init(width: 270, height: 0) : .zero)
					.onTapGesture {
						if mapState == .showingSideMenu {
							withAnimation(.spring(dampingFraction: 0.7)) {
								mapState = .default
							}
						}
					}

        if mapState == .default {
          LocationSearchButton()
            .padding(.top, 80)
            .onTapGesture {
              withAnimation(.spring(dampingFraction: 0.7)) {
                mapState = .searchingForLocation
              }
            }
        } else if mapState == .searchingForLocation {
          LocationSearch(mapState: $mapState)
        }

        MapActionButton(mapState: $mapState)
					.frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading)
          .padding(.top, 8)
      }
    }
    .sheet(
      isPresented: .constant($mapState.wrappedValue.willTriggerRideRequest()),
      onDismiss: { mapState = .default }
    ) {
      TripCard()
				.padding(.horizontal)
				.modifier(TripCardModifier())
    }
    .onReceive(LocationManager.shared.$userLocation) { location in
      if let location = location {
        locationViewModel.userLocation = location
      }
    }
  }
  
}

// MARK: - Home_Previews

struct Home_Previews: PreviewProvider {
  
  static var previews: some View {
    Home()
      .environmentObject(LocationSearchViewModel())
  }
  
}
