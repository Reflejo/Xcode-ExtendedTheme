//
//  NSColor+ExtendedTheme.m
//  ExtendedTheme
//
//  Created by Martin Conte Mac Donell on 4/27/15.
//

#import "NSColor+ExtendedTheme.h"

static NSColor *nextSetColor;

@implementation NSColor (ExtendedTheme)

/**
 Forces given color to be set when `set` method is called from the given block.

 @param color The background color to be set.
 @param block The block that sets the color.
 */
+ (void)forceColor:(NSColor *)color inBlock:(void (^)(void))block
{
    nextSetColor = color;
    block();
    nextSetColor = nil;
}

/**
 Swizzled `set` method in order to avoid hardcoded whites to be applied.
 */
- (void)conditionalSet {
    if (nextSetColor != nil) {
        return [nextSetColor set];
    }

    [self conditionalSet];
}

@end