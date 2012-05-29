//
//  Dijktra.h
//  TPS
//
//  Created by martin magalong on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodeManager.h"
#import "Node.h"
#import "Path.h"

@interface Dijktra : NSObject
/* Computes and returns integer value for the travel cost(int). */
+ (int)findPath:(Node *)start withEnd:(Node*)end withEdges:(NSMutableArray *)pathList withNodeManager:(NodeManager *)nodeManager;

/* Gets the neibors of a node and update the cost value if necessary. */
+ (void)relaxNeighbor:(Node *)node nodeList:(NSMutableArray *)nodeList pathList:(NSMutableArray *)pathList;

/* Returns an array of nodes(the path). */
+ (void)getPath:(Node *)node container:(NSMutableArray *)container;

/* Sorts array of dictionary in ascending according by key*/
+ (NSMutableArray *)sortArrayOfDictionary:(NSMutableArray *)array byKey:(NSString *)key;

@end
