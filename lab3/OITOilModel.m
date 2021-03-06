//
//  OITOilModel.m
//  lab3
//
//  Created by Travis Churchill on 6/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITOilModel.h"
#import "OITCarController.h"

#define kBaseRateOfCooling      -0.01f

@implementation OITOilModel

- (id)init
{
    self = [super init];
    if (self) {
        _minValue = 50;
        _maxValue = 100;
        _value = 50; //psi?
        _modelType = @"oil";
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)update {
    if (![[OITCarController sharedOITCarController] isOn]) {
        [self setFinalValue:_minValue WithRate:kBaseRateOfCooling];
    }
    [super update];
}
@end
