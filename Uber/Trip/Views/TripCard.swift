//
//  TripCard.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/8/23.
//

import SwiftUI

// MARK: - TripCard

struct TripCard: View {
	
	var body: some View {
		VStack {
			TripItinerary()
			Divider()
				.padding(.vertical, 5)
			TripRideSelection()
			Divider()
				.padding(.vertical, 5)
			TripPaymentMethodSelection()
				.padding(.bottom, 5)
			TripConfirmRideButton()
		}
	}
	
}

// MARK: - TripCard_Previews

struct TripCard_Previews: PreviewProvider {
	
	static var previews: some View {
		ZStack {
			Color.theme.secondaryBackgroundColor
				.ignoresSafeArea()
		}
		.sheet(isPresented: .constant(true)) {
			TripCard()
				.environmentObject(LocationSearchViewModel())
				.padding(.horizontal)
				.modifier(TripCardModifier())
		}
	}
	
}
