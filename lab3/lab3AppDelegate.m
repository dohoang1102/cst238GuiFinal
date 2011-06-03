//
//  lab3AppDelegate.m
//  lab3
//
//  Created by Travis Churchill on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "lab3AppDelegate.h"
#import "OITCarController.h"
#import "OITLogger.h"

@implementation lab3AppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // TODO: attach CarController
    [OITLogger logFromSender:[self description] message:@"application Did Finish Launching"];
    OITCarController* car = [[OITCarController alloc] init];
    [car startUpdateTimer];
}

@end
