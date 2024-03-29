//
//  HomeMap.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/19/23.
//

import SwiftUI
import MapKit

struct HomeMap {
  @EnvironmentObject var locationViewModel: LocationSearchViewModel
  @Binding var appState: AppState
  
  let mapView = MKMapView()
  let locationManager = LocationManager.shared
}

extension HomeMap: UIViewRepresentable {
  func makeUIView(context: Context) -> some UIView {
    mapView.delegate = context.coordinator
    mapView.isRotateEnabled = false
    mapView.isZoomEnabled = false
    mapView.isScrollEnabled = false
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
    return mapView
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
    switch appState {
    case .idle:
      context.coordinator.clearMapViewAndRecenterOnUserRegion()
			context.coordinator.toggleIsMapInteractive()
      context.coordinator.parent.mapView.userTrackingMode = .follow
    case .locationSelected:
      if let destination = locationViewModel.selectedDestination {
        context.coordinator.addAndSelectAnnotation(with: destination.coordinate)
        context.coordinator.configurePolyline(with: destination.coordinate)
      }
      context.coordinator.parent.mapView.userTrackingMode = .none
		case .showingSideMenu:
			context.coordinator.toggleIsMapInteractive()
      context.coordinator.parent.mapView.userTrackingMode = .follow
    default:
      break
    }
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(parent: self)
  }
}

extension HomeMap {
  class Coordinator: NSObject, MKMapViewDelegate {
    let parent: HomeMap
    var userLocation: CLLocationCoordinate2D?
    var currentRegion: MKCoordinateRegion?
    
    init(parent: HomeMap) {
      self.parent = parent
      super.init()
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
      let region = MKCoordinateRegion(
        center: .init(
          latitude: userLocation.coordinate.latitude,
          longitude: userLocation.coordinate.longitude),
        span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01))
      
      if parent.appState == .idle {
        self.parent.mapView.setRegion(region, animated: true)
        self.currentRegion = region
        self.userLocation = userLocation.coordinate
      }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
      let polyline = MKPolylineRenderer(overlay: overlay)
      polyline.strokeColor = .systemBlue
      polyline.lineWidth = 6
      return polyline
    }
        
    fileprivate func addAndSelectAnnotation(with coordinate: CLLocationCoordinate2D) {
      parent.mapView.removeAnnotations(parent.mapView.annotations)
      let annotation = MKPointAnnotation()
      annotation.coordinate = coordinate
      parent.mapView.addAnnotation(annotation)
      parent.mapView.selectAnnotation(annotation, animated: true)
    }
    
    fileprivate func configurePolyline(with destination: CLLocationCoordinate2D) {
      guard let location = userLocation else {
        print("ERROR: Could not get user's location.")
        return
      }
      
      parent.locationViewModel.getDestinationRoute(from: location, to: destination) { route in
        self.parent.appState = .drawingRoute
        self.parent.mapView.removeOverlays(self.parent.mapView.overlays)
        self.parent.mapView.addOverlay(route.polyline)
        
        let mapRect = self.parent.mapView.mapRectThatFits(
          route.polyline.boundingMapRect,
          edgePadding: .init(top: 64, left: 32, bottom: 500, right: 32))
        self.parent.mapView.setRegion(.init(mapRect), animated: true)
      }
    }
    
    fileprivate func clearMapViewAndRecenterOnUserRegion() {
      parent.mapView.removeAnnotations(parent.mapView.annotations)
      parent.mapView.removeOverlays(parent.mapView.overlays)
      
      if let region = currentRegion {
        parent.mapView.setRegion(region, animated: true)
      }
    }
		
		fileprivate func toggleIsMapInteractive() {
			parent.mapView.isZoomEnabled.toggle()
			parent.mapView.isScrollEnabled.toggle()
		}
  }
}
