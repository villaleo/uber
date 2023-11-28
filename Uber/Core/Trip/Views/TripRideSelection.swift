//
//  TripRideSelection.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/8/23.
//

import SwiftUI

struct TripRideSelection: View {
	@State private var rideSelected: Ride = .uberX
	
	var body: some View {
		VStack {
			Text("Rides available".uppercased())
				.font(.subheadline)
				.foregroundColor(.gray)
				.frame(maxWidth: .infinity, alignment: .leading)
			ScrollView(.horizontal) {
				HStack(spacing: 12) {
					ForEach(Ride.allCases) { ride in
						TripRideSelectionCell(ride: ride)
							.modifier(TripRideSelectionCellModifier(rideSelected: rideSelected, ride: ride))
							.padding(.bottom)
							.onTapGesture {
								withAnimation(.spring()) {
									rideSelected = ride
								}
							}
					}
				}
			}
		}
	}
}

struct TripRideSelection_Previews: PreviewProvider {
	static var previews: some View {
		TripRideSelection()
			.environmentObject(LocationSearchViewModel())
			.padding(.horizontal)
	}
}
