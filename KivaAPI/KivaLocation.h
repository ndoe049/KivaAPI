//
//  KivaLocation.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/7/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "FromJSON.h"

@interface KivaLocation : NSObject <FromJSON>

@property (nonatomic, readonly) NSString *countryCode;
@property (nonatomic, readonly) NSString *country;
@property (nonatomic, readonly) NSString *town;
@property (nonatomic, readonly) CLLocation *coordinate;

@end
