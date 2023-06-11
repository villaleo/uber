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
			appState = .showingSideMenu
		default:
      appState = .idle
    }
  }
  
  private func imageName(for state: AppState) -> String {
    switch state {
		case .idle:
			return "line.3.horizontal"
		case .searchingForLocation, .locationSelected, .drawingRoute, .showing(_):
      return "arrow.left"
		case .showingSideMenu:
			return "arrow.right"
    }
  }
}

// MARK: - MapActionButton_Previews

struct MapActionButton_Previews: PreviewProvider {
  
  static var previews: some View {
    MapActionButton(appState: .constant(.idle))
  }
  
}
