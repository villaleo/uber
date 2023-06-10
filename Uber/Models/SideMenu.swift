//
//  SideMenu.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/10/23.
//

import Foundation

enum SideMenu: CaseIterable, Identifiable {
	
	case profile
	case history
	case promotion
	case preferences
	case contactUs
	case legal
	
	var id: Int {
		self.hashValue
	}
	
	var description: String {
		switch self {
		case .profile:
			return "Profile"
		case .history:
			return "Trip History"
		case .promotion:
			return "Earn as an Uber Driver"
		case .preferences:
			return "Preferences"
		case .contactUs:
			return "Contact Us"
		case .legal:
			return "Legal"
		}
	}
	
}
