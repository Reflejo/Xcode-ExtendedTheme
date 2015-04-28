//
//  NSTextField+ExtendedTheme.h
//  ExtendedTheme
//
//  Created by Martin Conte Mac Donell on 4/27/15.
//  Copyright (c) 2015 Inline-Studios. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSTextFieldCell (ExtendedTheme)

/**
 Sets the given color as the text color of every instance of the receiver class. This method will also cache
 the color for fast access.

 @param color The color that will be set as the text color of all receiver's instances.
 */
+ (void)setTextColor:(NSColor *)color;

/**
 Swizzled setTextColor: method.
 */
- (void)customSetTextColor:(NSColor *)aColor;

@end

@interface NSTextField (ExtendedTheme)

/**
 Sets the given color as the text color of every instance of the receiver class. This method will also cache
 the color for fast access.

 @param color The color that will be set as the text color of all receiver's instances.
 */
+ (void)setTextColor:(NSColor *)color;

/**
 Swizzled setTextColor: method.
 */
- (void)customSetTextColor:(NSColor *)aColor;

@end
