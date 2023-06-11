//
//  Home.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/19/23.
//

import SwiftUI

// MARK: - Home

struct Home: View {
  
  @EnvironmentObject var locationViewModel: LocationSearchViewModel
  @State private var appState = AppState.idle
	@State private var submenuSelection = SideMenuButton.profile

  var body: some View {
    ZStack {
      ZStack(alignment: .top) {
				if appState == .showingSideMenu {
					HomeSideMenu(appState: $appState, selection: $submenuSelection)
						.ignoresSafeArea()
				}
				
				if appState.isShowingSideMenuSubview() {
					SideMenuButton.view(for: submenuSelection)
				} else {
        	Map(appState: $appState)
						.shadow(radius: 8)
						.ignoresSafeArea()
						.offset(appState == .showingSideMenu ? .init(width: 270, height: 0) : .zero)
						.onTapGesture {
							if appState == .showingSideMenu {
								withAnimation(.spring(dampingFraction: 0.7)) {
									appState = .idle
								}
							}
						}

					if appState == .idle {
						LocationSearchButton()
							.padding(.top, 80)
							.onTapGesture {
								withAnimation(.spring(dampingFraction: 0.7)) {
									appState = .searchingForLocation
								}
							}
					} else if appState == .searchingForLocation {
						LocationSearch(appState: $appState)
					}
        }
				
				MapActionButton(appState: $appState)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.leading)
					.padding(.top, 8)
      }
    }
    .sheet(
      isPresented: .constant($appState.wrappedValue.willTriggerRideRequest()),
      onDismiss: { appState = .idle }
    ) {
      TripCard()
				.padding(.horizontal)
				.modifier(TripCardModifier())
    }
    .onReceive(LocationManager.shared.$userLocation) { location in
      if let location = location {
        locationViewModel.userLocation = location
      }
    }
  }
  
}

// MARK: - Home_Previews

struct Home_Previews: PreviewProvider {
  
  static var previews: some View {
    Home()
      .environmentObject(LocationSearchViewModel())
  }
  
}
