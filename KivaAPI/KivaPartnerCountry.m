//
//  KivaPartnerCountry.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/14/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaPartnerCountry.h"

static const NSString *kIsoCode			= @"iso_code";
static const NSString *kLocation		= @"location";
static const NSString *kGeo				= @"geo";
static const NSString *kLevel			= @"level";
static const NSString *kPairs			= @"pairs";
static const NSString *kName			= @"name";
static const NSString *kRegion			= @"region";

@implementation KivaPartnerCountry

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_isoCode = [dictionary objectForKey:kIsoCode];
		_name = [dictionary objectForKey:kName];
		_region = [dictionary objectForKey:kRegion];
		
		NSDictionary *geo = [[dictionary objectForKey:kLocation] objectForKey:kGeo];
		_coordinate = nil;
		_level = nil;
		
		if (geo) {
			_level = [geo objectForKey:kLevel];
			NSString *cordinateValue = [geo objectForKey:kPairs];
			NSArray *values = [cordinateValue componentsSeparatedByString:@" "];
			if ([values count] >= 2) {
				_coordinate = [[CLLocation alloc] initWithLatitude:[[values objectAtIndex:0] doubleValue] longitude:[[values objectAtIndex:1] doubleValue]];
			}
		}
	}

	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaPartnerCountry[name = %@, isoCode = %@, region = %@, coordinate = %@, level = %@]",
			_name,
			_isoCode,
			_region,
			_coordinate,
			_level];
}

@end
