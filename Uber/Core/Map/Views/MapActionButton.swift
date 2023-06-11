//
//  MapActionButton.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/20/23.
//

import SwiftUI

// MARK: - MapActionButton

struct MapActionButton: View {
  
  @Binding var appState: AppState
	@Binding var mapOffset: (CGFloat, CGFloat)
	@Binding var homeSideMenuOffset: (CGFloat, CGFloat)
  
  var body: some View {
    Button {
			withAnimation(.spring(dampingFraction: 0.7)) {
        action(for: appState)
      }
    } label: {
      Image(systemName: imageName(for: appState))
        .font(.title2)
        .foregroundColor(.black)
        .padding()
        .background(.white)
        .clipShape(Circle())
        .shadow(radius: 6)
    }
  }
  
  // MARK: Helpers
  
  private func action(for state: AppState) {
    switch appState {
    case .idle:
			homeSideMenuOffset = (0, 0)
			mapOffset = (270, 0)
			appState = .showingSideMenu
		default:
			homeSideMenuOffset = (0, 0)
			mapOffset = (0, 0)
      appState = .idle
    }
  }
  
  private func imageName(for state: AppState) -> String {
    switch state {
		case .idle:
			return "line.3.horizontal"
		case .searchingForLocation, .locationSelected, .drawingRoute:
      return "arrow.left"
		case .showingSideMenu, .showing(_):
			return "arrow.right"
    }
  }
}

// MARK: - MapActionButton_Previews

struct MapActionButton_Previews: PreviewProvider {
  
  static var previews: some View {
		MapActionButton(
			appState: .constant(.idle),
			mapOffset: .constant((0, 0)),
			homeSideMenuOffset: .constant((0, 0))
		)
  }
  
}
