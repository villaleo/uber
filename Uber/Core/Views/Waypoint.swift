//
//  Waypoint.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/6/23.
//

import SwiftUI

// MARK: - Waypoint

struct Waypoint: View {
	
  var body: some View {
    VStack {
      Circle()
        .fill(Color.systemGray)
        .frame(width: 6, height: 6)
      Rectangle()
        .fill(Color.systemGray)
        .frame(width: 1, height: 25)
      Rectangle()
        .fill(Color.theme.primaryTextColor)
        .frame(width: 6, height: 6)
    }
  }
  
}

// MARK: - Waypoint_Previews

struct Waypoint_Previews: PreviewProvider {
  
  static var previews: some View {
    Waypoint()
  }
  
}
