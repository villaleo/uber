//
//  LocationManager.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/19/23.
//

import CoreLocation

// MARK: - LocationManager

class LocationManager: NSObject, ObservableObject {
  
  // MARK: Properties
  
  @Published var userLocation: CLLocationCoordinate2D?
  
  private let manager = CLLocationManager()
  static let shared = LocationManager()
  
  // MARK: Lifecycle
  
  override init() {
    super.init()
    manager.delegate = self
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.requestWhenInUseAuthorization()
    manager.startUpdatingLocation()
  }
  
}

// MARK: Conform to CLLocationManagerDelegate

extension LocationManager: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager,
											 didUpdateLocations locations: [CLLocation])
	{
    guard let location = locations.first else {
      return
    }
    
    userLocation = location.coordinate
    manager.stopUpdatingLocation()
  }
  
}
