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
      withAnimation(.spring()) {
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
      break // TODO: Side menu
    default:
      mapState = .default
    }
  }
  
  private func imageName(for state: MapState) -> String {
    switch state {
    case .searchingForLocation, .locationSelected, .drawingRoute:
      return "arrow.left"
    default:
      return "line.3.horizontal"
    }
  }
}

// MARK: - MapActionButton_Previews

struct MapActionButton_Previews: PreviewProvider {
  
  static var previews: some View {
    MapActionButton(mapState: .constant(.default))
  }
  
}
