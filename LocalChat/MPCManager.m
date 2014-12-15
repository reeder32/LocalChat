//
//  MPCManager.m
//  LocalChat
//
//  Created by Nick Reeder on 12/1/14.
//  Copyright (c) 2014 Nick Reeder. All rights reserved.
//

#import "MPCManager.h"

@implementation MPCManager

-(id)init {
    self = [super init];
    
    if (self) {
        self.peerID = nil;
        self.session = nil;
        self.browser = nil;
        self.advertiser = nil;
        
        self.connectedPeers = [NSMutableArray array];
        
        [self setupPeeraAndSessionWithDisplayName:@"Nick Reeder"];
        [self advertiseSelf:TRUE];
        
    }
    return self;
}


-(void)setupMCBBrowser{
    self.browser = [[MCBrowserViewController alloc] initWithServiceType:@"chat" session:self.session];
}

-(void)setupPeeraAndSessionWithDisplayName:(NSString *)displayName{
    self.peerID = [[MCPeerID alloc]initWithDisplayName:displayName];
    self.session = [[MCSession alloc]initWithPeer:self.peerID];
    self.session.delegate = self;
}

-(void)advertiseSelf:(BOOL)shouldAdvertise{
    
    if (shouldAdvertise) {
        self.advertiser = [[MCAdvertiserAssistant alloc]initWithServiceType:@"chat" discoveryInfo:nil session:self.session];
        [self.advertiser start];
    } else {
        [self.advertiser stop];
        self.advertiser = nil;
    }
}

-(void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress{
    
}

-(void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID{
    
    NSDictionary *dict = @{@"data": data,
                           @"peerID": peerID
                           };
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"MPCDidReceiveData" object:nil userInfo:dict];
                           
}

-(void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID{
    
}


-(void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error{
    
}

-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state{
    if (state != MCSessionStateConnecting) {
        if (state == MCSessionStateConnected){
            [self.connectedPeers addObject:peerID.displayName];
        } else if  (state == MCSessionStateNotConnected){
            if ([self.connectedPeers count] > 0) {
                NSInteger indexOfPeers = [self.connectedPeers indexOfObject:peerID.displayName];
                [self.connectedPeers removeObjectAtIndex:indexOfPeers];
            }
        }
    }
    [[NSNotificationCenter defaultCenter]
         postNotificationName:@"MPCDidChangeStateNotification"
         object:nil
         userInfo:nil];
}


@end

