//
//  KivaLenderSearchCriteria.m
//  KivaAPI
//
//  Created by Nathan Doe on 1/10/15.
//  Copyright (c) 2015 Nathaniel Doe. All rights reserved.
//

#import "KivaLenderSearchCriteria.h"

static const NSString *kCountryKey				= @"country_code";
static const NSString *kSortByKey				= @"sort_by";
static const NSString *kQueryKey				= @"q";
static const NSString *kPageKey					= @"page";
static const NSString *kIdsOnlyKey				= @"ids_only";
static const NSString *kOccupationKey			= @"occupation";

static const NSString *kTrue					= @"true";
static const NSString *kFalse					= @"false";

@implementation KivaLenderSearchCriteria

- (id)init {
	if (self = [super init]) {
		_values = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (void)addValue:(const NSString *)value withKey:(const NSString *)key {
	if (value && key) {
		NSDictionary *d = [[NSDictionary alloc] initWithObjectsAndKeys:value, @"value", key, @"key", nil];
		[_values addObject:d];
	}
}

- (void)addNumericValue:(NSNumber *)value withKey:(const NSString *)key {
	if (value && key) {
		NSDictionary *d = [[NSDictionary alloc] initWithObjectsAndKeys:\
						   [NSString stringWithFormat:@"%d", [value intValue]], @"value", key, @"key", nil];
		[_values addObject:d];
	}
}

- (void)addValues:(NSArray *)values withKey:(const NSString *)key {
	if (values && key) {
		NSString *value = @"";
		NSString *delimeter = @"";
		
		for (NSObject *o in values) {
			if ([o isKindOfClass:[NSString class]]) {
				value = [value stringByAppendingFormat:@"%@%@", delimeter, o];
				delimeter = @",";
			} else if ([o isKindOfClass:[NSNumber class]]) {
				value = [value stringByAppendingFormat:@"%@%d", delimeter, [(NSNumber *)o intValue]];
				delimeter = @",";
			}
		}
		
		NSDictionary *d = [[NSDictionary alloc] initWithObjectsAndKeys:value, @"value", key, @"key", nil];
		[_values addObject:d];
	}
}

#pragma mark - Adding parameters

- (void)country:(NSString *)country {
	[self addValue:country withKey:kCountryKey];
}

- (void)countries:(NSArray *)countries {
	[self addValues:countries withKey:kCountryKey];
}

- (void)occupation:(NSString *)occupation {
	[self addValue:occupation withKey:kOccupationKey];
}

- (void)returnIdsOnly {
	[self addValue:kTrue withKey:kIdsOnlyKey];
}

- (void)query:(NSString *)query {
	[self addValue:query withKey:kQueryKey];
}

- (void)page:(NSNumber *)pageNumber {
	[self addNumericValue:pageNumber withKey:kPageKey];
}

#pragma mark - Sorting

- (void)sortByOldest {
	[self addValue:kTrue withKey:kSortByKey];
}

#pragma mark - URL Builder

- (NSString *)build {
	NSString *urlValue = @"";
	NSString *delimeter = @"";
	
	for (NSDictionary *d in _values) {
		NSString *key = [d objectForKey:@"key"];
		NSString *value = [d objectForKey:@"value"];
		urlValue = [urlValue stringByAppendingFormat:@"%@%@=%@", delimeter, key, value];
		delimeter = @"&";
	}
	
	urlValue = [[urlValue stringByReplacingOccurrencesOfString:@"(null)" withString:@""]
				stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSLog(@"Built Search : %@", urlValue);
	
	return urlValue;

}

#pragma mark - Helper

- (BOOL)isOnlyIds {
	for (NSDictionary *d in _values) {
		NSString *key = [d objectForKey:@"key"];
		if ([kIdsOnlyKey isEqualToString:key]) {
			NSString *value = [d objectForKey:@"value"];
			return [kTrue isEqualToString:value];
		}
	}
	
	return NO;
}

#pragma mark -

- (NSString *)description {
	NSString *output = @"";
	NSString *delimeter = @"";
	for (NSDictionary *d in _values) {
		NSString *key = [d objectForKey:@"key"];
		NSString *value = [d objectForKey:@"value"];
		output = [output stringByAppendingFormat:@"%@%@=%@", delimeter, key, value];
		delimeter = @", ";
	}
	
	return [NSString stringWithFormat:@"KivaLenderSearchCriteria[%@]", output];
}

@end
