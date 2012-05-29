//
//  Node.m
//  TPS2
//
//  Created by martin magalong on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Node.h"

@implementation Node
@synthesize cost = _cost;
@synthesize name = _name;
@synthesize nodeId = _nodeId;
@synthesize parentNode = _parentNode;

- (id)initNodeId:(int)nodeId withName:(NSString *)name withCost:(int)cost
{
    self = [super init];
    if(self)
    {
        _nodeId = nodeId;
        _name = name;
        _cost = cost;
        _parentNode = nil;
    }
    return self;
}

- (void)setCost:(int)cost
{
    _cost = cost;
}

- (void)setParentNode:(Node *)parentNode
{
    _parentNode = parentNode;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ : nodeId=%d name=%@ cost=%d",[super description],_nodeId,_name,_cost];
}
@end
