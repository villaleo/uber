//
//  AppState.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/31/23.
//

import Foundation

enum AppState: Equatable {
  case idle
  case searchingForLocation
  case locationSelected
  case drawingRoute
	
	case showingSideMenu
	case showing(view: SideMenuButton)
	
	static func ==(lhs: AppState, rhs: AppState) -> Bool {
		switch lhs {
		case .showing(let view):
			switch rhs {
			case .showing(let otherView):
				return view == otherView
			default:
				return false
			}
		default:
			return "\(lhs)" == "\(rhs)"
		}
	}
  
  func willTriggerRideRequest() -> Bool {
    switch self {
    case .locationSelected, .drawingRoute:
      return true
    default:
      return false
    }
  }
	
	func isShowingSideMenuSubview() -> Bool {
		switch self {
		case .showing(_):
			return true
		default:
			return false
		}
	}
}
