//
//  UberApp.swift
//  Uber
//
//  Created by Leonardo Villalobos on 5/19/23.
//

import SwiftUI

@main
struct UberApp: App {
  @StateObject var locationViewModel = LocationSearchViewModel()
	
  var body: some Scene {
    WindowGroup {
      Home().environmentObject(locationViewModel)
    }
  }
}
