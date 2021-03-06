//
//  OITAnalogGagueController.h
//  lab3
//
//  Created by Travis Churchill on 6/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AGagueController.h"
#import "OITAnalogDial.h"

@interface OITAnalogGagueController : AGagueController {
@private
    OITAnalogDial*  _rpm;
    OITAnalogDial*  _speed;
    OITAnalogDial*    _gear;
    OITAnalogDial*    _fuel;
    OITAnalogDial*    _oil;
    OITAnalogDial*    _temp;
    OITAnalogDial*    _charge;
    
    OITAnalogDial*    _odometer;
    OITAnalogDial*    _trip;
}

@end
