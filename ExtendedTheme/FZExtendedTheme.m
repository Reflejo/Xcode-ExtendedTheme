//
//  FZExtendedTheme.h
//  ExtendedTheme
//
//  Created by Martin Conte Mac Donell on 4/27/15.
//

#import "NSTextField+ExtendedTheme.h"
#import "NSColor+ExtendedTheme.h"
#import "NSView+ExtendedTheme.h"
#import "FZExtendedTheme.h"
#import "JRSwizzle.h"

static NSString const *FZFontAndColorThemes = @"FontAndColorThemes";
static NSString const *FZExtendedThemeKey = @"FZExtendedTheme";

@implementation FZExtendedTheme

/**
 Gets current Xcode dvtcolortheme file URL.

 @return The current theme URL file.
 */
+ (NSURL *)currentThemeURL
{
    Class DVTFontAndColorTheme = NSClassFromString(@"DVTFontAndColorTheme");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    id currentTheme = [DVTFontAndColorTheme performSelector:@selector(currentTheme)];
    NSString *relativePath = [FZFontAndColorThemes stringByAppendingPathComponent:[currentTheme name]];

    id preferenceSetsManager = [DVTFontAndColorTheme performSelector:@selector(preferenceSetsManager)];
    id dataStore = [preferenceSetsManager performSelector:@selector(userPreferenceSetsDataStore)];
    id dataArchiver = [dataStore performSelector:@selector(dataArchiver)];
    id rootDirectoryPath = [dataArchiver performSelector:@selector(rootDirectoryPath)];
    id themePath = [rootDirectoryPath performSelector:@selector(filePathForRelativePathString:)
                                           withObject:relativePath];
    return [themePath performSelector:@selector(fileURL)];
#pragma clang diagnostic pop
}

/**
 Main plugin initialization.
 */
+ (void)ide_initializeWithOptions:(int)options error:(NSError **)error
{
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:[self currentThemeURL]];
    NSDictionary *extendedTheme = plist[FZExtendedThemeKey];
    for (NSString *key in extendedTheme)
    {
        NSColor *color = [NSColor dvt_colorFromRGBAString:extendedTheme[key]];
        Class XcodeClass = NSClassFromString(key);
        if ([key hasPrefix:@"DVTheme_"])
        {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
            id currentTheme = [NSClassFromString(@"DVTTheme") performSelector:@selector(currentTheme)];
#pragma clang diagnostic pop
            NSMutableDictionary *contents = [currentTheme valueForKey:@"_contents"];
            NSString *themeKey = [key substringFromIndex:8];
            contents[themeKey] = color;
        }
        else if ([XcodeClass isSubclassOfClass:[NSTextField class]] ||
                 [XcodeClass isSubclassOfClass:[NSTextFieldCell class]])
        {
            [XcodeClass setTextColor:color];
            [XcodeClass jr_swizzleMethod:@selector(setTextColor:)
                              withMethod:@selector(customSetTextColor:) error:nil];

        }
        else if ([XcodeClass isSubclassOfClass:[NSView class]])
        {
            [XcodeClass setColor:color];
            [XcodeClass jr_swizzleMethod:@selector(drawRect:) withMethod:@selector(customDrawRect:) error:nil];
        }

        [XcodeClass jr_swizzleMethod:@selector(effectiveTitleColor)
                          withMethod:@selector(customEffectiveTitleColor)
                               error:nil];
    }

    // Since there are a lot of places where the code (white) is hardcoded inside xcode, we need to swizzle
    // the set method from `NSCachedWhiteColor` to modify the background color.
    [NSClassFromString(@"NSCachedWhiteColor") jr_swizzleMethod:@selector(set)
                                                    withMethod:@selector(conditionalSet)
                                                         error:nil];
}

@end
