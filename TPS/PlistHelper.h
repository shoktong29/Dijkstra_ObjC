//
//  PlistHelper.h
//  DreamHouse
//
//  Created by Deng on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistHelper : NSObject

/**
 Returns a plist data that can be manually cast.
 @param fileName Filename of the plist without the .plist extension.
 @returns Loosely-typed plist data
 */
+ (id)read:(NSString *)fileName;

/**
 Stores a plist data in an array.
 @param fileName Filename of the plist without the .plist extension.
 @returns Array representation of a plist.
 */
+ (NSArray *)getArray:(NSString *)fileName;

/**
 Stores a plist data in dictionary.
 @param fileName Filename of the plist without the .plist extension.
 @returns Dictionary representation of a plist.
 */
+ (NSDictionary *)getDictionary:(NSString *)fileName;


/**
 Writes an array/dictionary to plist
 @param plist Array/Dictionary
 @param fileName Filename of the plist
 */
+ (void)write:(id)data fileName:(NSString *)fileName;

@end
