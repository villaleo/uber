//
//  ProfileActionsList.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/11/23.
//

import SwiftUI

// MARK: - ProfileActionsList

struct ProfileActionsList: View {
	
	var body: some View {
		ScrollView {
			VStack {
				HStack(spacing: 15) {
					ProfileQuickActionButton(label: "Help", imageName: "lifepreserver.fill")
					ProfileQuickActionButton(label: "Wallet", imageName: "creditcard.fill")
					ProfileQuickActionButton(label: "Trips", imageName: "clock.fill")
				}
				.padding(.top)
				
				Divider()
					.padding(.top, 20)
				
				HStack {
					VStack(alignment: .leading) {
						ProfileActionsListRow(label: "Send a gift", imageName: "gift.fill")
						ProfileActionsListRow(label: "Messages", imageName: "envelope.fill")
						ProfileActionsListRow(
							label: "Family",
							subLabel: "Manage a family profile",
							imageName: "person.3.fill"
						)
						ProfileActionsListRow(label: "Earn by driving or delivering", imageName: "person.fill")
						ProfileActionsListRow(label: "Business hub", imageName: "suitcase.fill")
						ProfileActionsListRow(label: "Partner Rewards", imageName: "trophy.fill")
						ProfileActionsListRow(label: "Uber Eats promotions", imageName: "tag.fill")
						ProfileActionsListRow(label: "Uber Eats favorites", imageName: "heart.fill")
						ProfileActionsListRow(label: "Legal", imageName: "info.circle.fill")
					}
					Spacer()
				}
				.padding(.horizontal)
			}
		}
	}
	
}

// MARK: - ProfileActionsList_Previews

struct ProfileActionsList_Previews: PreviewProvider {
	
	static var previews: some View {
		ProfileActionsList()
	}
	
}
