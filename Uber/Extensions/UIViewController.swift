//
//  UIViewController.swift
//  Uber
//
//  Created by Leonardo Villalobos on 6/8/23.
//

import UIKit

extension UIViewController {
	
	func screen() -> UIScreen? {
		var parent = self.parent
		var lastParent = parent
		
		while parent != nil {
			lastParent = parent
			parent = parent!.parent
		}
		
		return lastParent?.view.window?.windowScene?.screen
	}
	
}
