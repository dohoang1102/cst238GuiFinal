//
//  OITMeterManager.m
//  lab3
//
//  Created by Travis Churchill on 6/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITMeterManager.h"

#import "OITRPMModel.h"
#import "OITFuelModel.h"
#import "OITVelocityModel.h"
#import "OITGearBox.h"

#import "OITLogger.h"

@implementation OITMeterManager

- (id)init
{
    self = [super init];
    if (self) {
        _rpm = [[OITRPMModel alloc] init];
        [_rpm setDelegate:self];
        _gearBox = [[OITGearBox alloc] init];
        [_gearBox setDelegate:self];
        _speed = [[OITVelocityModel alloc] init];
        [_speed setDelegate:self];
        _fuel = [[OITFuelModel alloc] init];
        [_fuel setDelegate:self];
        
        _allMeters = [[NSArray arrayWithObjects:_rpm, _gearBox, _speed, _fuel, nil] retain];  //shorthand reference point
    }
    return self;
}

- (void)dealloc
{
    [_allMeters release];
    [_rpm release];
    _rpm = nil;
    [_gearBox release];
    _gearBox = nil;
    [_speed release];
    _speed = nil;
    [_fuel  release];
    _fuel = nil;
    [super dealloc];
}

- (void)updateMeters {
    for (AModel *model in _allMeters) {
        [model update];
        NSString* modelMessage = [NSString stringWithFormat:@"%@ has a value of %f",[model description] , [model value]];
        [OITLogger logFromSender:[self description] message:modelMessage];
    }
}

- (void)gasPressed {
    [_rpm incrementDeltaBy:300];
}

- (void)brakePressed {
    [_rpm incrementDeltaBy:-500];
}

- (void)fuelIsEmpty:(id)sender {
    
}

- (void)modelDidUpdate:(AModel*)sender {
    
}

@end