//
//  NSView+ExtendedTheme.h
//  ExtendedTheme
//
//  Created by Martin Conte Mac Donell on 4/27/15.
//

#import <AppKit/AppKit.h>

@interface NSView ()

/**
 This method is implemented on an Xcode NSView category.
 */
- (NSColor *)effectiveTitleColor;

@end

@interface NSView (ExtendedTheme)

/**
 Sets the given color as the background of every instance of the receiver class. This method will also cache
 the color for fast access.

 @param color The color that will be set as the background of all receiver's instances.
 */
+ (void)setColor:(NSColor *)color;

/**
 Swizzled drawRect: method.
 */
- (void)customDrawRect:(NSRect)dirtyRect;


/**
 Replaces the effectiveTitleColor on xcode's views that implement it.

 @return The color given to setColor
 */
- (NSColor *)customEffectiveTitleColor;

@end
