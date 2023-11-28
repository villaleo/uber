//
//  LocationManager.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/19/23.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
  @Published var userLocation: CLLocationCoordinate2D?
  private let manager = CLLocationManager()
  static let shared = LocationManager()
  
  override init() {
    super.init()
    manager.delegate = self
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.requestWhenInUseAuthorization()
    manager.startUpdatingLocation()
  }
}

extension LocationManager: CLLocationManagerDelegate {
  func locationManager(
    _ manager: CLLocationManager,
    didUpdateLocations locations: [CLLocation])
	{
    guard let location = locations.first else {
      return
    }
    userLocation = location.coordinate
    manager.stopUpdatingLocation()
  }
}
