//
//  Double.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/6/23.
//

import Foundation

extension Double {
  
  private var formatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    return formatter
  }
  
  // MARK: Helpers
  
  func asCurrency() -> String {
    return formatter.string(for: self) ?? ""
  }
  
}
