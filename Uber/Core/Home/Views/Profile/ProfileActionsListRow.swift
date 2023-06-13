//
//  ProfileActionsListRow.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/11/23.
//

import SwiftUI

// MARK: - ProfileActionsListRow

struct ProfileActionsListRow: View {
	
	let label: String
	var subLabel: String? = nil
	let imageName: String
	
	var body: some View {
		Button {
			
		} label: {
			HStack {
				Image(systemName: imageName)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 20, height: 20)
					.padding(.trailing, 20)
				VStack(alignment: .leading) {
					Text(label)
						.bold()
					if let subLabel = subLabel {
						Text(subLabel)
							.font(.caption)
							.foregroundColor(.gray)
					}
				}
			}
		}
		.foregroundColor(.theme.primaryTextColor)
		.padding(.vertical, 15)
	}
	
}

// MARK: - ProfileActionsListRow_Previews

struct ProfileActionsListRow_Previews: PreviewProvider {
	
	static var previews: some View {
		ProfileActionsListRow(label: "Family", subLabel: "Manage a family", imageName: "person.3.fill")
	}
	
}
