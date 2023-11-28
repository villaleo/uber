//
//  Profile.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/10/23.
//

import SwiftUI

struct Profile: View {
	var body: some View {
		VStack {
			HStack(spacing: 20) {
				Text("Leonardos Villalobos")
					.font(.largeTitle)
					.bold()
					.lineLimit(2)
				Spacer()
				Image("PortraitOfMe")
					.renderingMode(.original)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 100, height: 100)
					.clipShape(Circle())
					.shadow(radius: 5)
			}
			ProfileRatingButton()
				.padding(.leading)
			ProfileActionsList()
				.scrollIndicators(.hidden)
			Spacer()
		}
		.foregroundColor(.theme.primaryTextColor)
		.padding(.horizontal)
	}
}

struct Profile_Previews: PreviewProvider {
	static var previews: some View {
		Profile()
	}
}
