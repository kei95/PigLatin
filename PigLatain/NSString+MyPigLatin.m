//
//  NSString+MyPigLatin.m
//  PigLatain
//
//  Created by Yamashtia Keisuke on 2019-08-07.
//  Copyright © 2019 Yamashtia Keisuke. All rights reserved.
//

#import "NSString+MyPigLatin.h"

@implementation NSString (MyPigLatin)
- (NSString *)stringByPigLatinization {
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
    NSArray *clusters = @[@"Ch", @"Sh", @"Sm", @"St", @"Th", @"Ps", @"Ph", @"Pl", @"Gl"];
    NSMutableArray *pigLatinized = [NSMutableArray array];
    for (NSString* word in [self componentsSeparatedByString:@" "]) {
        if ([clusters containsObject:[word substringToIndex:2]]) {
            [pigLatinized addObject: [[[NSString stringWithFormat:@"%@%@ay", [word substringFromIndex:2], [word substringToIndex:2]] lowercaseString] capitalizedString]];
        }
        else if (![vowels characterIsMember:[word characterAtIndex:0]]) {
            [pigLatinized addObject: [[[NSString stringWithFormat:@"%@%cay", [word substringFromIndex:1], [word characterAtIndex:0]] lowercaseString] capitalizedString]];
        } else {
            [pigLatinized addObject: [[NSString stringWithFormat:@"%@ay", [word lowercaseString]] capitalizedString]];
        }
    }
    return [pigLatinized componentsJoinedByString:@" "];
}

- (NSString *) pigLatin {
    id x[3] = {0, [self componentsSeparatedByString:@" "], [NSMutableArray new]};
    for (*((unsigned long *) (void *) (&x[0])) = 0; (*((unsigned long *) (void *) (&x[0])) < [(NSArray *) x[1] count]); [(NSMutableArray *) x[2] addObject:[[[NSRegularExpression regularExpressionWithPattern:@"^(ch|sh|sm|st|th|ps|ph|pl|gl|[bcdfghjklmnpqrstvwxyz])?([a-z]+)" options:NSRegularExpressionCaseInsensitive error:NULL] stringByReplacingMatchesInString:[(NSArray *) x[1] objectAtIndex:*((unsigned long *) (void *) (&x[0]))] options:0 range:NSMakeRange(0, [(NSString *) [(NSArray *) x[1] objectAtIndex:*((unsigned long *) (void *) (&x[0]))] length]) withTemplate:@"$2$1ay"] capitalizedString]], ++*((unsigned long *) (void *) (&x[0])));
    return *((unsigned long *) (void *) &x[0]) = 0, [(NSMutableArray *) x[2] componentsJoinedByString:@" "];
}
@end

