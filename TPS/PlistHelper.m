//
//  PlistHelper.m
//  DreamHouse
//
//  Created by Deng on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlistHelper.h"

@implementation PlistHelper

+ (id)read:(NSString *)fileName {
    NSData *plistData;
    NSString *error;
    NSPropertyListFormat format;
    id plist;
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    plistData = [NSData dataWithContentsOfFile:localizedPath];
    
    plist = [NSPropertyListSerialization propertyListFromData:plistData mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error];
    if (!plist) {
        NSLog(@"Error reading plist from file '%s', error = '%s'", [localizedPath UTF8String], [error UTF8String]);
    }
    
    return plist;
}

+ (NSArray *)getArray:(NSString *)fileName
{
    return (NSArray *)[self read:fileName];
}

+ (NSDictionary *)getDictionary:(NSString *)fileName
{
    return (NSDictionary *)[self read:fileName];
}

+ (void)write:(id)data fileName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [paths objectAtIndex:0];
    NSString *cachePath = [libraryPath stringByAppendingPathComponent:@"/Caches/Plist"];
    cachePath = [cachePath stringByAppendingFormat:@"/%@.plist",fileName];
    [(NSDictionary *)data writeToFile:cachePath atomically:YES];
}


@end
