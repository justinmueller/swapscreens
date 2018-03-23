//
//  main.swift
//  Swap Screens
//
//  Created by Justin Mueller on 9/15/17.
//  Copyright © 2017 Justin Mueller. All rights reserved.
//

import Foundation

// Start display config
var config: CGDisplayConfigRef?
CGBeginDisplayConfiguration(&config)

// Get the amount of displays
var displayCount: UInt32 = 0
CGGetOnlineDisplayList(0, nil, &displayCount)

// Get the display IDs
var displays = [CGDirectDisplayID](repeating: 0, count: Int(displayCount))
CGGetOnlineDisplayList(displayCount, &displays, nil)

let display1 = displays[0]
let display2 = displays[1]
let display1Bounds = CGDisplayBounds(display1)
let display2Bounds = CGDisplayBounds(display2)

CGConfigureDisplayOrigin(
	config,
	display1,
	Int32(display2Bounds.origin.x),
	Int32(display2Bounds.origin.y)
)

CGConfigureDisplayOrigin(
	config,
	display2,
	Int32(display1Bounds.origin.x),
	Int32(display1Bounds.origin.y)
)

// Commit the change
CGCompleteDisplayConfiguration(config, .permanently)
