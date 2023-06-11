//
//  HomeSideMenuButton.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/10/23.
//

import SwiftUI

// MARK: - HomeSideMenuButton

struct HomeSideMenuButton: View {
	
	@Binding var appState: AppState
	@Binding var selection: SideMenuButton
	
	let label: String
	
	var body: some View {
		Button {
			withAnimation(.spring(dampingFraction: 0.7)) {
				appState = .showing(view: selection)
			}
		} label: {
			Text(label)
				.padding(.vertical, 8)
				.fontWeight(.semibold)
				.foregroundColor(.theme.primaryTextColor)
		}
	}
	
}

// MARK: - HomeSideMenuButton_Previews

struct HomeSideMenuButton_Previews: PreviewProvider {
	
	static var previews: some View {
		HomeSideMenuButton(appState: .constant(.showingSideMenu), selection: .constant(.profile), label: "Profile")
	}
	
}
