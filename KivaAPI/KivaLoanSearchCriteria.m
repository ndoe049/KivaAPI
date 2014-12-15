//
//  KivaLoanSearchCriteria.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/15/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaLoanSearchCriteria.h"

static const NSString *kStatusKey				= @"status";
static const NSString *kGenderKey				= @"gender";
static const NSString *kRegionKey				= @"region";
static const NSString *kCountryKey				= @"country_code";
static const NSString *kSectorKey				= @"sector";
static const NSString *kPartnerKey				= @"partner";
static const NSString *kThemeKey				= @"themes";
static const NSString *kBorrowerTypeKey			= @"borrower_type";
static const NSString *kPartnerRiskMinKey		= @"partner_risk_rating_min";
static const NSString *kPartnerRiskMaxKey		= @"partner_risk_rating_max";
static const NSString *kPartnerArrearsMinKey	= @"partner_arrears_min";
static const NSString *kPartnerArrearsMaxKey	= @"partner_arrears_max";
static const NSString *kPartnerDefaultMinKey	= @"partner_default_min";
static const NSString *kPartnerDefaultMaxKey	= @"partner_default_max";
static const NSString *kPartnerRiskIncludeKey	= @"partner_risk_include_nonrated";
static const NSString *kIncludeCurrencyRiskKey	= @"include_curr_risk";
static const NSString *kSortByKey				= @"sort_by";
static const NSString *kQueryKey				= @"q";
static const NSString *kPageKey					= @"page";
static const NSString *kPerPageKey				= @"per_page";
static const NSString *kIdsOnlyKey				= @"ids_only";

static const NSString *kTrue					= @"true";
static const NSString *kFalse					= @"false";

@implementation KivaLoanSearchCriteria

- (id)init {
	if (self = [super init]) {
		_values = [[NSMutableArray alloc] init];
	}
	
	return self;
}

#pragma mark - Adding parameters

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

#pragma mark -

- (void)status:(const NSString *)status {
	[self addValue:status withKey:(NSString *)kStatusKey];
}

- (void)gender:(Gender)gender {
	NSString *genderValue = (NSString *)kFemaleGender;
	if (gender == MALE) {
		genderValue = (NSString *)kMaleGender;
	}
	[self addValue:genderValue withKey:(NSString *)kGenderKey];
}

- (void)region:(NSString *)region {
	[self addValue:region withKey:(NSString *)kRegionKey];
}

- (void)regions:(NSArray *)regions {
	[self addValues:regions withKey:kRegionKey];
}

- (void)country:(NSString *)country {
	[self addValue:country withKey:kCountryKey];
}

- (void)countries:(NSArray *)countries {
	[self addValues:countries withKey:kCountryKey];
}

- (void)sector:(NSString *)sector {
	[self addValue:sector withKey:kSectorKey];
}

- (void)sectors:(NSArray *)sectors {
	[self addValues:sectors withKey:kSectorKey];
}

- (void)partner:(NSNumber *)partnerId {
	[self addNumericValue:partnerId withKey:kPartnerKey];
}

- (void)partners:(NSArray *)partnerIds {
	[self addValues:partnerIds withKey:kPartnerKey];
}

- (void)theme:(NSString *)theme {
	[self addValue:theme withKey:kThemeKey];
}

- (void)themes:(NSArray *)themes {
	[self addValues:themes withKey:kThemeKey];
}

- (void)borrowerType:(NSString *)borrowerType {
	[self addValue:borrowerType withKey:kBorrowerTypeKey];
}

- (void)partnerMinRiskRating:(NSNumber *)minRiskRating {
	[self addNumericValue:minRiskRating withKey:kPartnerRiskMinKey];
}

- (void)partnerMaxRiskRating:(NSNumber *)maxRiskRating {
	[self addNumericValue:maxRiskRating withKey:kPartnerRiskMaxKey];
}

- (void)partnerMinArrears:(NSNumber *)minArrears {
	[self addNumericValue:minArrears withKey:kPartnerArrearsMinKey];
}

- (void)partnerMaxArrears:(NSNumber *)maxArrears {
	[self addNumericValue:maxArrears withKey:kPartnerArrearsMaxKey];
}

- (void)partnerMinDefault:(NSNumber *)minDefault {
	[self addNumericValue:minDefault withKey:kPartnerDefaultMinKey];
}

- (void)partnerMaxDefault:(NSNumber *)maxDefault {
	[self addNumericValue:maxDefault withKey:kPartnerDefaultMaxKey];
}

- (void)includeUnratedPartners:(BOOL)includeUnrated {
	if (includeUnrated) {
		[self addValue:kTrue withKey:kPartnerRiskIncludeKey];
	} else {
		[self addValue:kFalse withKey:kPartnerRiskIncludeKey];
	}
}

- (void)includeCurrnecyRiskPartners:(BOOL)includeCurrencyRisk {
	if (includeCurrencyRisk) {
		[self addValue:kTrue withKey:kIncludeCurrencyRiskKey];
	} else {
		[self addValue:kFalse withKey:kIncludeCurrencyRiskKey];
	}
}

- (void)returnIdsOnly:(BOOL)idsOnly {
	if (idsOnly) {
		[self addValue:kTrue withKey:kIdsOnlyKey];
	} else {
		[self addValue:kFalse withKey:kIdsOnlyKey];
	}
}

#pragma mark - Sorting

- (void)sortByField:(NSString *)sortParam {
	[self addValue:sortParam withKey:kSortByKey];
}

- (void)sortByFields:(NSArray *)sortParams {
	[self addValues:sortParams withKey:kSortByKey];
}

#pragma mark -

- (void)query:(NSString *)query {
	[self addValue:query withKey:kQueryKey];
}

- (void)page:(NSNumber *)pageNumber {
	[self addNumericValue:pageNumber withKey:kPageKey];
}

- (void)loansPerPage:(NSNumber *)loansPerPage {
	[self addNumericValue:loansPerPage withKey:kPerPageKey];
}

#pragma mark - URL builder

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

@end
