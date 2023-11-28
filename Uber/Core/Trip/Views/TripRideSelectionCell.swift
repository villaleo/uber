//
//  TripRideSelectionCell.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/8/23.
//

import SwiftUI

struct TripRideSelectionCell: View {
	@EnvironmentObject var location: LocationSearchViewModel
	let ride: Ride
	
	var body: some View {
		VStack(alignment: .center) {
			Image(ride.imageName)
				.resizable()
				.frame(width: 85, height: 85)
				.scaledToFit()
			VStack(alignment: .leading, spacing: 2.5) {
				Text(ride.description)
					.font(.subheadline)
					.bold()
					.multilineTextAlignment(.leading)
					.lineLimit(2)
				Text(location.computeRidePrice(for: ride).asCurrency())
					.font(.subheadline)
					.bold()
			}
			.padding(5)
		}
	}
}

struct TripRideSelectionCell_Previews: PreviewProvider {
	static var previews: some View {
		TripRideSelectionCell(ride: .uberComfort)
			.environmentObject(LocationSearchViewModel())
	}
}
