//
//  NSColor+ExtendedTheme.h
//  ExtendedTheme
//
//  Created by Martin Conte Mac Donell on 4/27/15.
//  Copyright (c) 2015 Inline-Studios. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSColor ()

/**
 This method is actually implemented by xcode categories. It is used to create a color from a plist entry.
 */
+ (NSColor *)dvt_colorFromRGBAString:(NSString *)string;

@end

@interface NSColor (ExtendedTheme)

/**
 Swizzled `set` method in order to avoid hardcoded whites to be applied.
 */
- (void)conditionalSet;

/**
 Forces given color to be set when `set` method is called from the given block.

 @param color The background color to be set.
 @param block The block that sets the color.
 */
+ (void)forceColor:(NSColor *)color inBlock:(void (^)(void))block;

@end
