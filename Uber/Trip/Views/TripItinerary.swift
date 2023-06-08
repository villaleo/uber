//
//  TripItinerary.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/8/23.
//

import SwiftUI

// MARK: - TripItinerary

struct TripItinerary: View {
	
	@EnvironmentObject var location: LocationSearchViewModel
	
	var body: some View {
		HStack {
			Waypoint()
				.padding(.trailing)
			
			VStack(alignment: .leading, spacing: 25) {
				HStack {
					Text("Current location")
						.foregroundColor(.gray)
						.bold()
					Spacer()
					Text(location.pickupTime ?? "00:00 AM")
						.foregroundColor(.lightGray)
				}
				
				HStack {
					Text(location.selectedDestination?.title ?? "Destination")
						.bold()
					Spacer()
					Text(location.dropoffTime ?? "00:00 AM")
						.foregroundColor(.lightGray)
				}
			}
		}
	}
	
}

//MARK: - TripItinerary_Previews

struct TripItinerary_Previews: PreviewProvider {
	
	static var previews: some View {
		TripItinerary()
			.environmentObject(LocationSearchViewModel())
			.padding(.horizontal)
	}
	
}
