//
//  AModel.m
//  lab3
//
//  Created by Travis Churchill on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AModel.h"


@implementation AModel

@synthesize value = _value;
@synthesize delta = _delta;
@synthesize delegate = _delegate;

- (id)init
{
    self = [super init];
    if (self) {
        _minValue = 0;
        _maxValue = 0;
        _value = 0;
        _modelType = @"model";
    }
    
    return self;
}

- (void)dealloc
{
    [_modelType release];
    _modelType = nil;
    
    [super dealloc];
}

- (void)incrementValueBy:(float) value {
    self.value += value;
    if (_value > _maxValue) {
        _value = _maxValue;
    }
    if (_value < _minValue ) {
        _value = _minValue;
    }
}

- (void)incrementDeltaBy:(float) delta {
    _delta += delta;
}

- (void)update {
    if (_value != _finalValue) {
        [self incrementValueBy:_delta];
    }
    [_delegate modelDidUpdate:self];
    NSString* notification = [NSString stringWithFormat:@"%@DidUpdate", _modelType];
    [[NSNotificationCenter defaultCenter] postNotificationName:notification object:self];
}

/**
 *  For display purposes
 */
- (float)percentOfMax {
    return _value / _maxValue;
}

- (void)setFinalValue:(float)value WithRate:(float)rate {
    _finalValue = value > _maxValue? _maxValue : value;
    [self setDelta:rate];
}

@end
