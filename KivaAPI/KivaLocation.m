//
//  KivaLocation.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/7/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaLocation.h"

static const NSString *kCountryCode = @"country_code";
static const NSString *kCountry		= @"country";
static const NSString *kTown		= @"town";
static const NSString *kLocation	= @"geo";
static const NSString *kCoordinate	= @"pairs";

@implementation KivaLocation

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_countryCode = [dictionary objectForKey:kCountryCode];
		_country = [dictionary objectForKey:kCountry];
		_town = [dictionary objectForKey:kTown];
		_coordinate = nil;

		NSDictionary *geo = [dictionary objectForKey:kLocation];
		if (geo) {
			NSString *cordinateValue = [geo objectForKey:kCoordinate];
			NSArray *values = [cordinateValue componentsSeparatedByString:@" "];
			if ([values count] >= 2) {
				_coordinate = [[CLLocation alloc] initWithLatitude:[[values objectAtIndex:0] doubleValue] longitude:[[values objectAtIndex:1] doubleValue]];
			}
		}
	}
	
	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaLocation[countryCode = %@, country = %@, town = %@, coordinate = %@]",
			_countryCode,
			_country,
			_town,
			_coordinate];
}

@end
