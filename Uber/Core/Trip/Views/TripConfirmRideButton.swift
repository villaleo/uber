//
//  TripConfirmRideButton.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/8/23.
//

import SwiftUI

struct TripConfirmRideButton: View {
	var body: some View {
		Button {
			// TODO: Action
		} label: {
			Rectangle()
				.fill(.blue)
				.cornerRadius(10)
				.frame(height: 50)
				.overlay {
					Text("Confirm ride".uppercased())
						.bold()
						.foregroundColor(.white)
				}
		}
	}
}

struct TripConfirmRideButton_Previews: PreviewProvider {
	static var previews: some View {
		TripConfirmRideButton()
			.padding(.horizontal)
	}
}
