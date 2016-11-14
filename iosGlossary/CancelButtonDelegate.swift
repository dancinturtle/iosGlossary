//
//  CancelButtonDelegate.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/8/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit


protocol CancelButtonDelegate: class {
    func cancelButtonPressedFrom(controller: UIViewController)
}
