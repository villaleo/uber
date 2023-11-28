//
//  Ride.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/1/23.
//

import CoreLocation
import Foundation

enum Ride: Int, Identifiable, CaseIterable {
  case uberX
  case uberComfort
  case uberBlack
  
  var id: Int {
    self.rawValue
  }
  
  var description: String {
    switch self {
    case .uberX: return "UberX"
    case .uberComfort: return "Uber Comfort"
    case .uberBlack: return "Uber Black"
    }
  }
  
  var imageName: String {
    switch self {
    case .uberX: return "UberX"
    case .uberComfort: return "UberComfort"
    case .uberBlack: return "UberBlack"
    }
  }
  
  var baseFare: Double {
    switch self {
    case .uberX:
      return 5
    case .uberComfort:
      return 10
    case .uberBlack:
      return 20
    }
  }
  
  func computePrice(for distanceInMeters: CLLocationDistance) -> Double {
    let distanceInMiles = distanceInMeters / 1600
    switch self {
    case .uberX:
      return distanceInMiles * 1.5 + baseFare
    case .uberComfort:
      return distanceInMiles * 2 + baseFare
    case .uberBlack:
      return distanceInMiles * 2.5 + baseFare
    }
  }
}
