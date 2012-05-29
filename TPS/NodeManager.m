//
//  NodeManager.m
//  TPS
//
//  Created by martin magalong on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NodeManager.h"
#import "Node.h"

@implementation NodeManager
@synthesize nodeList = _nodeList;

- (id)init
{
    self = [super init];
    if(self)
    {
        _nodeList = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)makeNodeWithid:(int)nodeId withName:(NSString *)name
{
    Node *_node = [[Node alloc]initNodeId:nodeId withName:name withCost:10000];
    [_nodeList addObject:_node];
}

- (Node *)getNodeWithId:(int)nodeId;
{
    for(int x=0; x<_nodeList.count; x++)
    {
        Node *_node = [_nodeList objectAtIndex:x];
        if(nodeId == _node.nodeId)
        {
            return _node;
        }
    }
    return nil;
}
@end
