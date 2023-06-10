//
//  HomeSideMenuButton.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/10/23.
//

import SwiftUI

struct HomeSideMenuButton: View {
	
	let title: String
	
	var body: some View {
		Button {
			
		} label: {
			Text(title)
				.padding(.vertical, 8)
				.fontWeight(.semibold)
				.foregroundColor(.theme.primaryTextColor)
		}
	}
	
}

struct HomeSideMenuButton_Previews: PreviewProvider {
	
	static var previews: some View {
		HomeSideMenuButton(title: "Profile")
	}
	
}
