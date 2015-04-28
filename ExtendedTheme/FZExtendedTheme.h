//
//  FZExtendedTheme.h
//  ExtendedTheme
//
//  Created by Martin Conte Mac Donell on 4/27/15.
//

#import <Foundation/Foundation.h>

@protocol IDEInitialization

/**
 Main plugin initialization.
 */
+ (void)ide_initializeWithOptions:(int)options error:(NSError **)error;

@end

@interface FZExtendedTheme : NSObject <IDEInitialization>

@end
