//
//  SideMenuButton.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/10/23.
//

import Foundation
import SwiftUI

enum SideMenuButton: CaseIterable, Identifiable {
	
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
	
	static func view(for button: SideMenuButton) -> some View {
		Group {
			switch button {
			case .profile:
				Profile()
			case .history:
				History()
			case .promotion:
				Promotions()
			case .preferences:
				Preferences()
			case .contactUs:
				ContactUs()
			case .legal:
				Legal()
			}
		}
	}
	
}
