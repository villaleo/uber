//
//  TripPaymentMethodSelection.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/8/23.
//

import SwiftUI

struct TripPaymentMethodSelection: View {
	var body: some View {
		HStack(spacing: 12) {
			Text("Visa")
				.font(.subheadline)
				.fontWeight(.semibold)
				.padding(6)
				.background(.blue)
				.cornerRadius(5)
				.foregroundColor(.white)
			Spacer()
			Text("**** 1234")
				.fontWeight(.bold)
			Image(systemName: "chevron.right")
				.imageScale(.medium)
				.foregroundColor(.gray)
		}
		.padding(.horizontal)
		.frame(height: 50)
		.background(Color.theme.secondaryBackgroundColor)
		.cornerRadius(10)
	}
}

struct TripPaymentMethodSelection_Previews: PreviewProvider {
	static var previews: some View {
		TripPaymentMethodSelection().padding(.horizontal)
	}
}
