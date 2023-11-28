//
//  TripRideSelectionCellModifier.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/8/23.
//

import SwiftUI

struct TripRideSelectionCellModifier: ViewModifier {
	let rideSelected: Ride
	let ride: Ride
	
	func body(content: Content) -> some View {
		content
			.frame(
				width: ride == rideSelected ? 122 : 112,
				height: ride == rideSelected ? 190 : 180)
			.background(ride == rideSelected ? Color.systemBlue : Color.theme.secondaryBackgroundColor)
			.foregroundColor(ride == rideSelected ? .white : Color.theme.primaryTextColor)
			.scaleEffect(ride == rideSelected ? 1.125 : 1)
			.cornerRadius(10)
	}
}
