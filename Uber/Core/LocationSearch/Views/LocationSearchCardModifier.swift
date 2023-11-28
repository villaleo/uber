//
//  LocationSearchCardModifier.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/11/23.
//

import Foundation
import SwiftUI

struct LocationSearchCardModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.presentationDetents([.height(670), .height(675)])
			.presentationCompactAdaptation(.sheet)
			.presentationDragIndicator(.hidden)
			.presentationBackgroundInteraction(.enabled)
			.presentationCornerRadius(25)
			.interactiveDismissDisabled()
	}
}
