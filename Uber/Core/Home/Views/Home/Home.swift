//
//  Home.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/19/23.
//

import SwiftUI

struct Home: View {
  @EnvironmentObject var locationViewModel: LocationSearchViewModel
  @State private var appState = AppState.idle
	@State private var submenuSelection = SideMenuButton.profile
	@State private var mapOffset: (CGFloat, CGFloat) = (0, 0)
	@State private var homeSideMenuOffset: (CGFloat, CGFloat) = (0, 0)
	
  var body: some View {
    ZStack {
      ZStack(alignment: .top) {
				if appState.isShowingSideMenuSubview() {
					SideMenuButton.view(for: submenuSelection).padding(.top, 60)
				}
				if appState == .showingSideMenu || appState.isShowingSideMenuSubview() {
					HomeSideMenu(appState: $appState,
                       submenuSelection: $submenuSelection,
                       mapOffset: $mapOffset,
                       homeSideMenuOffset: $homeSideMenuOffset)
						.ignoresSafeArea()
						.offset(x: homeSideMenuOffset.0, y: homeSideMenuOffset.1)
				}
				HomeMap(appState: $appState)
					.shadow(radius: 8)
					.ignoresSafeArea()
					.offset(x: mapOffset.0, y: mapOffset.1)
					.onTapGesture {
						if appState == .showingSideMenu {
							withAnimation(.spring(dampingFraction: 0.7)) {
								mapOffset = (0, 0)
								appState = .idle
							}
						}
					}
					.sheet(isPresented: .constant(appState == .searchingForLocation)) {
						LocationSearchCard(appState: $appState).modifier(LocationSearchCardModifier())
					}
				HomeActionButton(appState: $appState,
                         mapOffset: $mapOffset,
                         homeSideMenuOffset: $homeSideMenuOffset)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.leading)
					.padding(.top, 8)

				if appState == .idle {
					LocationSearchButton(appState: $appState).padding(.top, 80)
				}
			}
    }
    .sheet(isPresented: .constant($appState.wrappedValue.willTriggerRideRequest()),
           onDismiss: { appState = .idle }) {
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

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
      .environmentObject(LocationSearchViewModel())
  }
}
