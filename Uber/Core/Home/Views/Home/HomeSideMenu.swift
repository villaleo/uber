//
//  HomeSideMenu.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/10/23.
//

import SwiftUI

// MARK: - HomeSideMenu

struct HomeSideMenu: View {
	
	@Binding var appState: AppState
	@Binding var selection: SideMenuButton
	
	var body: some View {
		ZStack(alignment: .leading) {
			Color.theme.secondaryBackgroundColor
				.ignoresSafeArea()
			
			VStack {
				Image("PortraitOfMe")
					.renderingMode(.original)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 130, height: 130)
					.clipShape(Circle())
					.shadow(radius: 5)
				Text("Leonardo Villalobos")
					.font(.title2)
					.bold()
				
				HStack {
					Image(systemName: "star.fill")
						.renderingMode(.original)
						.frame(width: 20, height: 20)
						.shadow(radius: 0.5)
					Text("5")
						.bold()
						.padding(.trailing, 8)
					Divider()
						.background(Color.theme.primaryTextColor)
					Image("UberOne")
						.renderingMode(.original)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 20, height: 20)
						.colorMultiply(.white)
						.shadow(radius: 0.5)
						.padding(.leading, 8)
				}
				.frame(height: 30)
				.padding(.bottom, 20)
				
				VStack(alignment: .leading) {
					ForEach(SideMenuButton.allCases) { selection in
						HomeSideMenuButton(appState: $appState,
															 selection: $selection,
															 label: selection.description)
					}
				}
				.font(.title3)
			}
			.padding(.horizontal, 30)
			
		}
		.foregroundColor(Color.theme.primaryTextColor)
		
	}
	
}

// MARK: - HomeSideMenu_Previews

struct HomeSideMenu_Previews: PreviewProvider {
	
	static var previews: some View {
		ZStack {
			HomeSideMenu(appState: .constant(.showingSideMenu), selection: .constant(.profile))
			
			Color.theme.backgroundColor
				.ignoresSafeArea()
				.shadow(radius: 10)
				.offset(x: 270)
		}
	}
	
}
