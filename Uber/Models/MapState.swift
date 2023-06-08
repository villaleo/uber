//
//  MapState.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/31/23.
//

import Foundation

// MARK: - MapState

enum MapState {

  case `default`
  case searchingForLocation
  case locationSelected
  case drawingRoute
  case recentering

  // MARK: Helpers
  
  func willTriggerRideRequest() -> Bool {
    switch self {
    case .locationSelected, .drawingRoute:
      return true
    default:
      return false
    }
  }
  
}
