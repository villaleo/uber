//
//  LocationSearchMapResultsCell.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/20/23.
//

import SwiftUI

// MARK: - LocationSearchMapResultsCell

struct LocationSearchMapResultsCell: View {
  
  let name: String
  let address: String
  
  var body: some View {
		VStack {
			HStack {
				Image(systemName: "mappin.circle.fill")
					.resizable()
					.foregroundColor(.blue)
					.tint(.white)
					.frame(width: 40, height: 40)
				
				VStack(alignment: .leading, spacing: 4) {
					Text(name)
						.font(.body)
						.foregroundColor(.primary)
					Text(address)
						.font(.subheadline)
						.foregroundColor(.gray)
				}
				.padding(.horizontal, 8)
				Spacer()
			}
			Divider()
		}
		.padding(.horizontal)
  }
  
}

// MARK: - LocationSearchMapResultsCell_Previews

struct LocationSearchMapResultsCell_Previews: PreviewProvider {
  
  static var previews: some View {
    Group {
      LocationSearchMapResultsCell(name: "Starbucks Coffee", address: "123 Main St Soledad, CA")
      
      VStack {
        ForEach(0..<10, id: \.self) { _ in
          LocationSearchMapResultsCell(name: "Starbucks Coffee", address: "123 Main St Soledad, CA")
        }
      }
      .previewDisplayName("Multiple Cells")
    }
  }
  
}
