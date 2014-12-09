//
//  ConnectViewController.h
//  LocalChat
//
//  Created by Nick Reeder on 11/24/14.
//  Copyright (c) 2014 Nick Reeder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h> 
#import "AppDelegate.h"

@interface ConnectViewController : UIViewController <MCBrowserViewControllerDelegate>

{
    AppDelegate *myAppDelegate;
    
}

@property (weak, nonatomic) IBOutlet UITableView *connectionsTableView;

@property (nonatomic, strong) NSArray *connectedPeers;

@end
