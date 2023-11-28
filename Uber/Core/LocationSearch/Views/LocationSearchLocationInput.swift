//
//  LocationSearchLocationInput.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/6/23.
//

import SwiftUI

struct LocationSearchLocationInput: View {
  @EnvironmentObject var viewModel: LocationSearchViewModel
  @State var startLocationText: String = ""
  
  var body: some View {
    VStack {
      Rectangle()
        .foregroundColor(.systemGroupedBackground)
        .frame(height: 32)
        .overlay {
          TextField("Current location", text: $startLocationText)
            .padding(.leading)
        }
        .cornerRadius(8)
      Rectangle()
        .foregroundColor(Color(.systemGray4))
        .frame(height: 32)
        .overlay {
          TextField("Where to?", text: $viewModel.queryFragment)
            .padding(.leading)
        }
        .cornerRadius(8)
    }
  }
}

struct LocationSearchLocationInput_Previews: PreviewProvider {
  static var previews: some View {
    LocationSearchLocationInput()
      .environmentObject(LocationSearchViewModel())
			.padding(.horizontal)
  }
}
