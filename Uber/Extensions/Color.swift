//
//  Color.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/6/23.
//

import SwiftUI

extension Color {
  
  // MARK: Properties
  
  static let lightGray = Color(.lightGray)
  static let systemGray = Color(.systemGray)
  static let systemBlue = Color(.systemBlue)
  static let systemGroupedBackground = Color(.systemGroupedBackground)
  
  static let theme = Theme()
  
}

// MARK: - Theme

struct Theme {
	
  let backgroundColor = Color("BackgroundColor")
  let primaryTextColor = Color("PrimaryTextColor")
  let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
	
}
