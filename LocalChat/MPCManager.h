//
//  MPCManager.h
//  LocalChat
//
//  Created by Nick Reeder on 12/1/14.
//  Copyright (c) 2014 Nick Reeder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface MPCManager : NSObject <MCSessionDelegate>

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCBrowserViewController *browser;
@property (nonatomic, strong) MCAdvertiserAssistant *advertiser;

@property (nonatomic, strong) NSMutableArray *connectedPeers;

-(void)setupPeeraAndSessionWithDisplayName:(NSString *)displayName;
-(void)setupMCBBrowser;
-(void)advertiseSelf:(BOOL)shouldAdvertise;


@end
