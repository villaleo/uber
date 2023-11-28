//
//  HomeSideMenuButton.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/10/23.
//

import SwiftUI

struct HomeSideMenuButton: View {
	@Binding var appState: AppState
	@Binding var selection: SideMenuButton
	@Binding var mapOffset: (CGFloat, CGFloat)
	@Binding var homeSideMenuOffset: (CGFloat, CGFloat)
	
	let label: String
	let target: SideMenuButton
	
	var body: some View {
		Button {
			withAnimation(.spring(dampingFraction: 0.7, blendDuration: 0.1)) {
				mapOffset = (450, 0)
			}
			withAnimation(.spring(dampingFraction: 0.7, blendDuration: 0.2).delay(0.2)) {
				homeSideMenuOffset = (450, 0)
				appState = .showing(view: selection)
				selection = target
			}
		} label: {
			Text(label)
				.padding(.vertical, 8)
				.fontWeight(.semibold)
				.foregroundColor(.theme.primaryTextColor)
		}
	}
}

struct HomeSideMenuButton_Previews: PreviewProvider {
	static var previews: some View {
		HomeSideMenuButton(
			appState: .constant(.showingSideMenu),
			selection: .constant(.profile),
			mapOffset: .constant((0, 0)),
			homeSideMenuOffset: .constant((0, 0)),
			label: "Profile",
			target: .profile)
	}
}
