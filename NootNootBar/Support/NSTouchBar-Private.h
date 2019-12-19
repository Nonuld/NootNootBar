//
//  NSTouchBar-Private.h
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 19/12/2019.
//  Copyright © 2019 Arnaud Le Bourblanc. All rights reserved.
//

@import Cocoa;

@interface NSFunctionRow: NSObject
+ (BOOL)isDynamicFunctionRowAvailable;
@end

extern void DFRElementSetControlStripPresenceForIdentifier(NSTouchBarItemIdentifier, BOOL);
extern void DFRSystemModalShowsCloseBoxWhenFrontMost(BOOL);

@interface NSTouchBarItem ()

+ (void)addSystemTrayItem:(NSTouchBarItem *)item;

@end

@interface NSTouchBar ()

// macOS 10.14 and above
+ (void)presentSystemModalTouchBar:(NSTouchBar *)touchBar systemTrayItemIdentifier:(NSTouchBarItemIdentifier)identifier NS_AVAILABLE_MAC(10.14);

// macOS 10.13 and below
+ (void)presentSystemModalFunctionBar:(NSTouchBar *)touchBar systemTrayItemIdentifier:(NSTouchBarItemIdentifier)identifier NS_DEPRECATED_MAC(10.12.2, 10.14);

@end
