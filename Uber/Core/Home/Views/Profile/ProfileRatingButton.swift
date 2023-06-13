//
//  ProfileRatingButton.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/12/23.
//

import SwiftUI

// MARK: - ProfileRatingButton

struct ProfileRatingButton: View {
	
	var body: some View {
		Button {
			
		} label: {
			HStack {
				HStack {
					Image(systemName: "star.fill")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 15, height: 15)
						.shadow(radius: 0.5)
					Text("5")
						.bold()
						.padding(.trailing, 8)
				}
				.background(
					Capsule()
						.frame(width: 65, height: 25)
						.foregroundColor(.theme.secondaryBackgroundColor)
				)
				Spacer()
			}
			.foregroundColor(.theme.primaryTextColor)
		}
	}
	
}

// MARK: - ProfileRatingButton_Previews

struct ProfileRatingButton_Previews: PreviewProvider {
	
	static var previews: some View {
		ProfileRatingButton()
	}
	
}
