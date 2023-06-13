//
//  LocationSearchButton.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/20/23.
//

import SwiftUI

// MARK: - LocationSearchButton

struct LocationSearchButton: View {
	
	@Binding var appState: AppState
  
  var body: some View {
		Button {
			withAnimation(.spring(dampingFraction: 0.7)) {
				appState = .searchingForLocation
			}
		} label: {
    	HStack {
				Rectangle()
					.fill(.black)
					.frame(width: 8, height: 8)
					.padding(.horizontal)
				Text("Where to?")
					.foregroundColor(.gray)
				Spacer()
			}
			.frame(width: UIScreen.main.bounds.width - 64, height: 50)
			.background(
				Rectangle()
					.fill(.white)
					.cornerRadius(5)
					.shadow(radius: 3)
			)
    }
  }
  
}

// MARK: - LocationSearchButton_Previews

struct LocationSearchButton_Previews: PreviewProvider {
  
  static var previews: some View {
		LocationSearchButton(appState: .constant(.idle))
  }
  
}
