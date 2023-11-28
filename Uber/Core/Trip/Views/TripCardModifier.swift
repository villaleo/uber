//
//  TripCardModifier.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/8/23.
//

import Foundation
import SwiftUI

struct TripCardModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.presentationDetents([.height(510), .height(500)])
			.presentationCompactAdaptation(.sheet)
			.presentationDragIndicator(.hidden)
			.presentationBackgroundInteraction(.enabled)
			.presentationCornerRadius(25)
			.interactiveDismissDisabled()
	}
}
