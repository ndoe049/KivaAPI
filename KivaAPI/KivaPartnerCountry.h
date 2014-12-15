//
//  KivaPartnerCountry.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/14/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "FromJSON.h"

@interface KivaPartnerCountry : NSObject <FromJSON>

@property (nonatomic, readonly) NSString *isoCode;
@property (nonatomic, readonly) NSString *level;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *region;
@property (nonatomic, readonly) CLLocation *coordinate;

@end
