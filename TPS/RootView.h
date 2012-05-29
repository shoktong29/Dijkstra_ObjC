//
//  RootView.h
//  TPS
//
//  Created by martin magalong on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NodeManager;
@interface RootView : UIView
{
    NSMutableArray *_edges;
    NodeManager *_nodeManager;
}

@end
