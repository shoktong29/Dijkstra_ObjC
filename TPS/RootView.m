//
//  RootView.m
//  TPS
//
//  Created by martin magalong on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootView.h"
#import "NodeManager.h"
#import "PlistHelper.h"
#import "Node.h"
#import "Path.h"
#import "Dijktra.h"

#define START_NODE_ID 1
#define END_NODE_ID 8

@interface RootView(private)
- (void)generateNodes;
- (void)generateEdges;
@end

@implementation RootView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        _nodeManager = [[NodeManager alloc]init];
        _edges = [[NSMutableArray alloc]init];
        
        //create nodes
        [self generateNodes];
        
        //set paths
        [self generateEdges];
        
        //Compute for shortest path
        int shortestPathCost = [Dijktra findPath:[_nodeManager getNodeWithId:START_NODE_ID] withEnd:[_nodeManager getNodeWithId:END_NODE_ID] withEdges:_edges withNodeManager:_nodeManager];
        NSLog(@"The cost of going from %@ and %@ is %d",[_nodeManager getNodeWithId:START_NODE_ID].name,[_nodeManager getNodeWithId:END_NODE_ID].name,shortestPathCost);
        
        NSMutableArray *path = [[NSMutableArray alloc]init];
        [Dijktra getPath:[_nodeManager getNodeWithId:END_NODE_ID] container:path];
    }
    return self;
}

- (void)generateNodes
{
    NSArray *_temp = [PlistHelper getArray:@"NodeData"];
    
    for (NSDictionary *temp in _temp) {
        int nodeId = [[temp objectForKey:@"id"]intValue];
        NSString *name = [temp objectForKey:@"name"];
        [_nodeManager makeNodeWithid:nodeId withName:name];
    }
}

- (void)generateEdges
{
    NSArray *_temp = [PlistHelper getArray:@"PathData"];
    for (NSDictionary *temp in _temp) {
        int startId = [[temp objectForKey:@"startId"]intValue];
        int endId = [[temp objectForKey:@"endId"]intValue];
        int cost = [[temp objectForKey:@"cost"] intValue];
        Path *_path = [[Path alloc]initPath:[_nodeManager getNodeWithId:startId] WithEnd:[_nodeManager getNodeWithId:endId] withCost:cost];
        [_edges addObject:_path];
    }
    
}

//- (void)TPS:(Node *)start withEnd:(Node*)end withEdges:(NSMutableArray *)pathList withNodes:(NSMutableArray *)nodeList
//{
//    
//    //Set the cost of origin to 0
//    [[_nodeManager getNodeWithId:start.nodeId] setCost:0];
//    NSMutableArray *_nodeList = [[NSMutableArray alloc]initWithArray:nodeList];
//    
//    //Get the node with the least cost value in the openList
//    while (_nodeList.count > 0) {
//        _nodeList = [self sortByCost:_nodeList];
//        Node *node = [_nodeList objectAtIndex:0];
//        //Get all the neigbor of the current node and update their cost value
//        [_nodeList removeObject:node];
//        [self relaxNeighbor:node nodeList:_nodeList pathList:pathList];
//    }
//    NSLog(@"Minimum cost from %@ to %@ is %d",start.name,end.name,end.cost);
//    [self getPath:end];
//
//}
//
//-(void)relaxNeighbor:(Node *)node nodeList:(NSMutableArray *)nodeList pathList:(NSMutableArray *)pathList
//{
//    for (int x=0; x<pathList.count; x++) {
//        Path *path = [pathList objectAtIndex:x];
//        if(path.start.nodeId == node.nodeId){
//            int currentCost = path.end.cost;
//            int newCost = node.cost+path.cost;
//            if(newCost < currentCost)
//            {
//                for(int y=0; y<nodeList.count; y++)
//                {
//                    Node *end = [nodeList objectAtIndex:y];
//                    if (end.nodeId == path.end.nodeId) {
//                        end.cost = newCost;
//                        [end setParentNode:path.start];
//                        break;
//                    }
//                }
//            }
//        }
//    }
//}
//
//- (void)getPath:(Node *)node
//{
//    [distPath insertObject:node atIndex:0];
//    if(node.parentNode != nil){
//        [self getPath:node.parentNode];
//    }
//    else {
//        for (int x=0; x<distPath.count; x++) {
//            NSLog(@" -> %@",[[distPath objectAtIndex:x] name]);
//        }
//    }
//}
//
//- (NSMutableArray *)sortByCost:(NSMutableArray *)array
//{
//    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc]initWithKey:@"cost" ascending:YES];
//    [array sortUsingDescriptors:[NSArray arrayWithObject:descriptor]];
//    return array;
//}

@end
