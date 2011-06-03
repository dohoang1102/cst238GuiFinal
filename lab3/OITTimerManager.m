//
//  OITTimerModel.m
//  lab3
//
//  Created by Travis Churchill on 6/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITTimerManager.h"
#import "OITLogger.h"

@implementation OITTimerManager

@synthesize delegate = _delegate;

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)dealloc
{
    [_updateTimer invalidate];
    [_updateTimer release];
    _updateTimer = nil;
    [super dealloc];
}


- (void)startTimerWithDelegate:(id<OITTimeManagerDelegate>)delegate {
    _delegate = delegate;
    [OITLogger logFromSender:[self description] message:@"starting timer"];
    _updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:_delegate selector:@selector(updateDisplay) userInfo:nil repeats:true];

}

- (void)buildThread:(id)sender {
    [OITLogger logFromSender:[self description] message:@"building thread"];
}
@end
