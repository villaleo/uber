//
//  ProfileQuickActionButton.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/11/23.
//

import SwiftUI

struct ProfileQuickActionButton: View {
	let label: String
	let imageName: String
	
	var body: some View {
		Button {
      // TODO: Action
		} label: {
			VStack {
				Image(systemName: imageName)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 35, height: 35)
				Text(label)
					.fontWeight(.medium)
			}
		}
		.frame(width: 110, height: 100)
		.background(Color.theme.secondaryBackgroundColor)
		.foregroundColor(.theme.primaryTextColor)
		.cornerRadius(10)
	}
}

struct ProfileQuickActionButton_Previews: PreviewProvider {
	static var previews: some View {
		ProfileQuickActionButton(label: "Help", imageName: "lifepreserver.fill")
	}
}
