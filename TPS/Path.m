//
//  Path.m
//  TPS2
//
//  Created by martin magalong on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Path.h"
#import "Node.h"

@implementation Path
@synthesize start = _start;
@synthesize end = _end;
@synthesize cost = _cost;

-(id)initPath:(Node *)start WithEnd:(Node *)end withCost:(int)cost
{
    self = [super init];
    if(self)
    {
        _start = start;
        _end = end;
        _cost = cost;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ : StartId=%d EndId=%d cost=%d",[super description],_start.nodeId,_end.nodeId,_cost];
}

@end
