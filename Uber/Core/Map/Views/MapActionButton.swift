//
//  MapActionButton.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/20/23.
//

import SwiftUI

// MARK: - MapActionButton

struct MapActionButton: View {
  
  @Binding var mapState: MapState
  
  var body: some View {
    Button {
			withAnimation(.spring(dampingFraction: 0.7)) {
        action(for: mapState)
      }
    } label: {
      Image(systemName: imageName(for: mapState))
        .font(.title2)
        .foregroundColor(.black)
        .padding()
        .background(.white)
        .clipShape(Circle())
        .shadow(radius: 6)
    }
  }
  
  // MARK: Helpers
  
  private func action(for state: MapState) {
    switch mapState {
    case .default:
			mapState = .showingSideMenu
		case .searchingForLocation, .locationSelected, .drawingRoute, .showingSideMenu:
      mapState = .default
    }
  }
  
  private func imageName(for state: MapState) -> String {
    switch state {
		case .default:
			return "line.3.horizontal"
		case .searchingForLocation, .locationSelected, .drawingRoute:
      return "arrow.left"
		case .showingSideMenu:
			return "arrow.right"
    }
  }
}

// MARK: - MapActionButton_Previews

struct MapActionButton_Previews: PreviewProvider {
  
  static var previews: some View {
    MapActionButton(mapState: .constant(.default))
  }
  
}
