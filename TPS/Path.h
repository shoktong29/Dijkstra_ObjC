//
//  Path.h
//  TPS2
//
//  Created by martin magalong on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Node;
@interface Path : NSObject
{
    
}
@property(nonatomic,readonly) __strong Node *start;
@property(nonatomic,readonly) __strong Node *end;
@property(nonatomic,assign) int cost;

-(id)initPath:(Node *)start WithEnd:(Node *)end withCost:(int)cost;
@end
