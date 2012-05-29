//
//  Node.h
//  TPS2
//
//  Created by martin magalong on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
{

}

@property (nonatomic,readonly) int cost;
@property (nonatomic,readonly) __strong NSString *name;
@property (nonatomic,readonly) int nodeId;
@property (nonatomic,readonly) Node *parentNode;


- (id)initNodeId:(int)nodeId withName:(NSString *)name withCost:(int)cost;
- (void)setCost:(int)cost;
- (void)setParentNode:(Node *)parentNode;
@end
