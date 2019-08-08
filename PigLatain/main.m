//
//  main.m
//  PigLatain
//
//  Created by Yamashtia Keisuke on 2019-08-07.
//  Copyright © 2019 Yamashtia Keisuke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+MyPigLatin.h"

int main(int argc, const char * argv[]) {
    
    NSString *s = [@"Kale Chips" pigLatin];
    NSLog(@"%@", s);
    
    return 0;
}
