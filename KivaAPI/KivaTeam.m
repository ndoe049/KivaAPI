//
//  KivaTeam.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/20/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaTeam.h"
#import "KivaImage.h"

static const NSString *kCategory		= @"category";
static const NSString *kDescription		= @"description";
static const NSString *kId				= @"id";
static const NSString *kImage			= @"image";
static const NSString *kLoanBeacuse		= @"loan_because";
static const NSString *kLoanCount		= @"loan_count";
static const NSString *kLoanedAmount	= @"loaned_amount";
static const NSString *kMemberCount		= @"member_count";
static const NSString *kMembershipType	= @"membership_type";
static const NSString *kName			= @"name";
static const NSString *kShortName		= @"shortname";
static const NSString *kTeamSince		= @"team_since";
static const NSString *kWebsiteUrl		= @"website_url";
static const NSString *kWhereabouts		= @"whereabouts";

@implementation KivaTeam

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_category = [dictionary objectForKey:kCategory];
		_teamDescription = [dictionary objectForKey:kDescription];
		_teamId = [NSNumber numberWithInt:[[dictionary objectForKey:kId] intValue]];
		_image = [[KivaImage alloc] initWithDictionary:[dictionary objectForKey:kImage]];
		_loanBecause = [dictionary objectForKey:kLoanBeacuse];
		_loanCount = [NSNumber numberWithInt:[[dictionary objectForKey:kLoanCount] intValue]];
		_loanedAmount = [NSNumber numberWithDouble:[[dictionary objectForKey:kLoanedAmount] doubleValue]];
		_memberCount = [NSNumber numberWithInt:[[dictionary objectForKey:kMemberCount] intValue]];
		_membershipType = [dictionary objectForKey:kMembershipType];
		_name = [dictionary objectForKey:kName];
		_shortName = [dictionary objectForKey:kShortName];
		_whereabouts = [dictionary objectForKey:kWhereabouts];
		_websiteUrl = [NSURL URLWithString:[dictionary objectForKey:kWebsiteUrl]];
		
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
		_teamSince = [formatter dateFromString:[dictionary objectForKey:kTeamSince]];
	}

	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaTeam[category = %@, teamDescription = %@, teamId = %d, image = %@, loanBecause = %@, loanCount = %d, loanedAmount = %f, memeberCount = %d, membershipType = %@, name = %@, shortName = %@, whereabouts = %@, websiteUrl = %@, teamSince = %@]",	_category,
			_teamDescription,
			[_teamId intValue],
			_image,
			_loanBecause,
			[_loanCount intValue],
			[_loanedAmount doubleValue],
			[_memberCount intValue],
			_membershipType,
			_name,
			_shortName,
			_whereabouts,
			_websiteUrl,
			_teamSince];
}

@end
