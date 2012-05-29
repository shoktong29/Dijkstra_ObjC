//
//  NodeManager.h
//  TPS
//
//  Created by martin magalong on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Node;
@interface NodeManager : NSObject
{
    
}
@property(nonatomic,readonly) __strong NSMutableArray *nodeList;

- (void)makeNodeWithid:(int)nodeId withName:(NSString *)name;
- (Node *)getNodeWithId:(int)nodeId;

@end
