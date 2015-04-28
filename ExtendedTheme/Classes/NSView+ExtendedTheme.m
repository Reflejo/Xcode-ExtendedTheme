//
//  NSView+ExtendedTheme.m
//  ExtendedTheme
//
//  Created by Martin Conte Mac Donell on 4/27/15.
//

#import "NSView+ExtendedTheme.h"
#import "NSColor+ExtendedTheme.h"

static NSMutableDictionary *colorsCache;

@implementation NSView (ExtendedTheme)

/**
 Sets the given color as the background (or text) of every instance of the receiver class. This method will 
 also cache the color for fast access.

 @param color The color that will be set as the background (or text) of all receiver's instances.
 */
+ (void)setColor:(NSColor *)color
{
    if (colorsCache == nil)
    {
        colorsCache = [NSMutableDictionary dictionary];
    }

    colorsCache[NSStringFromClass([self class])] = color;
}

/**
 Replaces the effectiveTitleColor on xcode's views that implement it.

 @return The color given to setColor
 */
- (NSColor *)customEffectiveTitleColor
{
    return colorsCache[NSStringFromClass([self class])];
}

/**
 Swizzled drawRect: method.
 */
- (void)customDrawRect:(NSRect)dirtyRect
{
    if ([self respondsToSelector:@selector(effectiveTitleColor)]) {
        return [self customDrawRect:dirtyRect];
    }

    NSColor *color = colorsCache[NSStringFromClass([self class])];
    if ([self respondsToSelector:@selector(setBackgroundColor:)]) {
        [self performSelector:@selector(setBackgroundColor:) withObject:color];
    }

    [[self layer] setBackgroundColor:color.CGColor];
    [color set];
    NSRectFill(dirtyRect);

    [NSColor forceColor:color inBlock:^{
        [self customDrawRect:dirtyRect];
    }];
}

@end
