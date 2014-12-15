//
//  KivaBorrower.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/12/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaBorrower.h"

static const NSString *kFirstName		= @"first_name";
static const NSString *kLastName		= @"last_name";
static const NSString *kGender			= @"gender";
static const NSString *kPictured		= @"pictured";

static const NSString *kMaleGender		= @"M";
static const NSString *kFemaleGneder	= @"F";

@implementation KivaBorrower

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_firstName = [dictionary objectForKey:kFirstName];
		_lastName = [dictionary objectForKey:kLastName];
		_pictured = [dictionary objectForKey:kPictured];
		
		NSString *gend = [dictionary objectForKey:kGender];
		if ([kMaleGender isEqualToString:gend]) {
			_gender = MALE;
		} else {
			_gender = FEMALE;
		}
	}
	
	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaBorrower[firstName = %@, lastName = %@, pictured = %d, gender = %ld]",
			_firstName,
			_lastName,
			_pictured,
			_gender];

}

@end
