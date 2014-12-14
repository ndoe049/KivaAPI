//
//  KivaLender.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/14/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//
// http://build.kiva.org/docs/data/lenders


#import "KivaLender.h"
#import "KivaImage.h"

static const NSString *kLenderId	= @"lender_id";
static const NSString *kName		= @"name";
static const NSString *kWhereAbouts	= @"whereabouts";
static const NSString *kCountryCode	= @"country_code";
static const NSString *kImage		= @"image";
static const NSString *kUid			= @"uid";

@implementation KivaLender

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_countryCode = [dictionary objectForKey:kCountryCode];
		_image = [[KivaImage alloc] initWithDictionary:[dictionary objectForKey:kImage]];
		_lenderId = [dictionary objectForKey:kLenderId];
		_lenderName = [dictionary objectForKey:kName];
		_uid = [dictionary objectForKey:kUid];
		_whereAbouts = [dictionary objectForKey:kWhereAbouts];
	}
	
	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaLender[countryCode = %@, image = %@, lenderId = %@, lenderName = %@, uid = %@, whereAbouts = %@]",
			_countryCode,
			_image,
			_lenderId,
			_lenderName,
			_uid,
			_whereAbouts];
}

@end
