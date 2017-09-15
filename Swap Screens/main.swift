//
//  main.swift
//  Swap Screens
//
//  Created by Justin Mueller on 9/15/17.
//  Copyright © 2017 Justin Mueller. All rights reserved.
//

import Foundation

// Start display config
var config:CGDisplayConfigRef? = nil;
CGBeginDisplayConfiguration(&config);

// Get the displays
let maxDisplays: UInt32 = 3;
var screens = [CGDirectDisplayID](repeating: 0, count: Int(maxDisplays));
var displayCount: UInt32 = 0;

CGGetOnlineDisplayList(maxDisplays, &screens, &displayCount);

// Handle the displays
for currentDisplay in screens {
    var bounds = CGDisplayBounds(currentDisplay);
    if (Int(bounds.origin.x) == -1920) {
        CGConfigureDisplayOrigin(config,currentDisplay, 1440, Int32(bounds.origin.y));
    } else if (Int(bounds.origin.x) == 1440) {
        CGConfigureDisplayOrigin(config,currentDisplay, -1920, Int32(bounds.origin.y));
    }
}

// Commit the change
CGCompleteDisplayConfiguration(config, CGConfigureOption.permanently);
print("Screens have been swapped.");
