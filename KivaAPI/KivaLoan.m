//
//  KivaLoan.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/7/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaLoan.h"
#import "KivaLocation.h"

static const NSString *kLoanId			= @"id";
static const NSString *kName			= @"name";
static const NSString *kDescription		= @"description";
static const NSString *kLanguages		= @"languages";
static const NSString *kStatus			= @"status";
static const NSString *kFundedAmount	= @"funded_amount";
static const NSString *kBasketAmount	= @"basket_amount";
static const NSString *kImage			= @"image";
static const NSString *kImageId			= @"id";
static const NSString *kActivity		= @"activity";
static const NSString *kSector			= @"sector";
static const NSString *kUse				= @"use";
static const NSString *kTheme			= @"theme";
static const NSString *kLocation		= @"location";
static const NSString *kPartnerId		= @"partner_id";
static const NSString *kPostedDate		= @"posted_date";
static const NSString *kPlannedEndDate	= @"planned_expiration_date";
static const NSString *kLoanAmount		= @"loan_amount";
static const NSString *kBorrowerCount	= @"borrower_count";
static const NSString *kLenderCount		= @"lender_count";
static const NSString *kBonusCredit		= @"bonus_credit_eligibility";
static const NSString *kTags			= @"tags";

static const NSString *kFundraising		= @"fundraising";
static const NSString *kFunded			= @"funded";
static const NSString *kInRepayment		= @"in_repayment";
static const NSString *kPaid			= @"paid";
static const NSString *kDefaulted		= @"defaulted";
static const NSString *kRefuned			= @"refunded";

@implementation KivaLoan

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_loanId = [NSNumber numberWithLong:[[dictionary objectForKey:kLoanId] longValue]];
		_name = [dictionary objectForKey:kName];
		
		NSDictionary *description = [dictionary objectForKey:kDescription];
		if (description) {
			_languages = [[NSArray alloc] initWithArray:[description objectForKey:kLanguages]];
		} else {
			_languages = [[NSArray alloc] init];
		}
		
		_status = [KivaLoan loanStatusFromString:[dictionary objectForKey:kStatus]];
		_fundedAmount = [NSNumber numberWithLong:[[dictionary objectForKey:kFundedAmount] longLongValue]];
		_basketAmount = [NSNumber numberWithLong:[[dictionary objectForKey:kBasketAmount] longLongValue]];
		
		NSDictionary *imageInfo = [dictionary objectForKey:kImage];
		if (imageInfo) {
			_imageId = [NSNumber numberWithLong:[[imageInfo objectForKey:kImageId] longLongValue]];
		} else {
			_imageId = [[NSNumber alloc] init];
		}
		
		_activity = [dictionary objectForKey:kActivity];
		_sector = [dictionary objectForKey:kSector];
		_use = [dictionary objectForKey:kUse];
		_theme = [dictionary objectForKey:kTheme];
		_location = [[KivaLocation alloc] initWithDictionary:[dictionary objectForKey:kLocation]];
		_partnerId = [[NSNumber alloc] initWithLong:[[dictionary objectForKey:kPartnerId] longValue]];
		
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy-MM-ddTHH:mm:ssZ"];
		_postedDate = [formatter dateFromString:[dictionary objectForKey:kPostedDate]];
		_plannedExpirationDate = [formatter dateFromString:[dictionary objectForKey:kPlannedEndDate]];
		
		_loanAmount = [[NSNumber alloc] initWithLong:[[dictionary objectForKey:kLoanAmount] longValue]];
		_borrowerCount = [[NSNumber alloc] initWithLong:[[dictionary objectForKey:kBorrowerCount] longValue]];
		_lenderCount = [[NSNumber alloc] initWithLong:[[dictionary objectForKey:kLenderCount] longValue]];
		_bonusCreditElibibility = [dictionary objectForKey:kBonusCredit];
		
		NSArray *tags = [dictionary objectForKey:kTags];
		NSMutableArray *values = [[NSMutableArray alloc] init];
		if (tags) {
			for (NSDictionary *d in tags) {
				[values addObject:[d objectForKey:kName]];
			}
		}
		
		_tags = [NSArray arrayWithArray:values];
	}
	
	return self;
}

+ (LoanStatus)loanStatusFromString:(NSString *)value {
	if ([kFundraising isEqualToString:value]) {
		return FUNDRAISING;
	} else if ([kFunded isEqualToString:value]) {
		return FUNDED;
	} else if ([kInRepayment isEqualToString:value]) {
		return IN_REPAYMENT;
	} else if ([kPaid isEqualToString:value]) {
		return PAID;
	} else if ([kDefaulted isEqualToString:value]) {
		return DEFAULTED;
	}
	
	return REFUNDED;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaLoan[loanId = %d, name = %@, status = %ld, fundedAmount = %d, basketAmount = %d, imageId = %d, activity = %@, sector = %@, use = %@, theme = %@, location = %@, partnerId = %d, postedDate = %@, plannedEndDate = %@, loanAmount = %d, borrowerCount = %d, lenderCount = %d]",
			[_loanId intValue],
			_name,
			_status,
			[_fundedAmount intValue],
			[_basketAmount intValue],
			[_imageId intValue],
			_activity,
			_sector,
			_use,
			_theme,
			_location,
			[_partnerId intValue],
			_postedDate,
			_plannedExpirationDate,
			[_loanAmount intValue],
			[_borrowerCount intValue],
			[_lenderCount intValue]];
			
}

@end
