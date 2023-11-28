//
//  LocationSearchViewModel.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/20/23.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
  @Published var results = [MKLocalSearchCompletion]()
  @Published var selectedDestination: TripDestination?
  @Published var pickupTime: String?
  @Published var dropoffTime: String?
  
  private let searchCompleter = MKLocalSearchCompleter()
  
  var queryFragment: String = "" {
    didSet {
      searchCompleter.queryFragment = self.queryFragment
    }
  }
  
  var userLocation: CLLocationCoordinate2D?
  
  override init() {
    super.init()
    searchCompleter.delegate = self
    searchCompleter.queryFragment = self.queryFragment
  }
  
  func selectLocation(_ location: MKLocalSearchCompletion) {
    self.selectedDestination = nil
    locationSearch(for: location) { response, error in
      guard error == nil else {
        print("ERROR: Could not search for location '\(location.title)'.")
        print("ERROR: \(error!.localizedDescription)")
        return
      }
      guard let item = response?.mapItems.first else {
        print("WARN: No items returned for '\(location.title)'")
        return
      }
      let coordinate = item.placemark.coordinate
      self.selectedDestination = .init(title: location.title, coordinate: coordinate)
    }
  }
  
  private func locationSearch(
    for localSearch: MKLocalSearchCompletion,
    completion: @escaping MKLocalSearch.CompletionHandler)
  {
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
		
    let search = MKLocalSearch(request: request)
    search.start(completionHandler: completion)
  }
  
  func computeRidePrice(for type: Ride) -> Double {
    guard let selectedDestination = self.selectedDestination else {
      print("ERROR: selected location coordinate is nil")
      return 0
    }
    guard let selectedLocation = self.userLocation else {
      print("ERROR: user location is nil")
      return 0
    }
    
    let location = CLLocation(
      latitude: selectedLocation.latitude,
      longitude: selectedLocation.longitude)
    let destination = CLLocation(
      latitude: selectedDestination.coordinate.latitude,
      longitude: selectedDestination.coordinate.longitude)
    let tripDistanceInMeters = location.distance(from: destination)
    return type.computePrice(for: tripDistanceInMeters)
  }
  
  func getDestinationRoute(
    from userLocation: CLLocationCoordinate2D,
    to destination: CLLocationCoordinate2D,
    completion: @escaping (MKRoute) -> Void)
  {
    let userPlacemark = MKPlacemark(coordinate: userLocation)
		let destinationPlacemark = MKPlacemark(coordinate: destination)
		
    let request = MKDirections.Request()
    request.source = MKMapItem(placemark: userPlacemark)
    request.destination = MKMapItem(placemark: destinationPlacemark)
    
    let directions = MKDirections(request: request)
    directions.calculate { response, error in
      guard error == nil else {
        print("ERROR: Could not fetch destination route.")
        print("ERROR: \(error!.localizedDescription).")
        return
      }
      guard let route = response?.routes.first else {
        print("WARN: No route was returned for '\(destination)'")
        return
      }
      self.configurePickupAndDropoffTimes(with: route.expectedTravelTime)
      completion(route)
    }
  }
  
  private func configurePickupAndDropoffTimes(with expectedTravelTime: TimeInterval) {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm a"
    
    pickupTime = formatter.string(from: .now)
    dropoffTime = formatter.string(from: .now + expectedTravelTime)
  }
}

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
  func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
    self.results = completer.results
  }
}
