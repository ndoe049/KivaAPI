//
//  KivaLoan.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/7/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaLoan.h"
#import "KivaLocation.h"
#import "KivaImage.h"
#import "KivaVideo.h"
#import "KivaBorrower.h"
#import "KivaPayment.h"
#import "KivaLocalPayment.h"
#import "KivaLossLiability.h"
#import "KivaScheduledPayment.h"

static const NSString *kLoanId				= @"id";
static const NSString *kName				= @"name";
static const NSString *kDescription			= @"description";
static const NSString *kLanguages			= @"languages";
static const NSString *kStatus				= @"status";
static const NSString *kFundedAmount		= @"funded_amount";
static const NSString *kBasketAmount		= @"basket_amount";
static const NSString *kImage				= @"image";
static const NSString *kActivity			= @"activity";
static const NSString *kSector				= @"sector";
static const NSString *kUse					= @"use";
static const NSString *kTheme				= @"theme";
static const NSString *kLocation			= @"location";
static const NSString *kPartnerId			= @"partner_id";
static const NSString *kPostedDate			= @"posted_date";
static const NSString *kPlannedEndDate		= @"planned_expiration_date";
static const NSString *kLoanAmount			= @"loan_amount";
static const NSString *kBorrowerCount		= @"borrower_count";
static const NSString *kLenderCount			= @"lender_count";
static const NSString *kBonusCredit			= @"bonus_credit_eligibility";
static const NSString *kTags				= @"tags";
static const NSString *kVideo				= @"video";

//Detailed Fields
static const NSString *kBorrowers			= @"borrowers";
static const NSString *kDescriptionText		= @"texts";
static const NSString *kJournalTotals		= @"journal_totals";
static const NSString *kJournalEntries		= @"entries";
static const NSString *kPayments			= @"payments";
static const NSString *kTerms				= @"terms";
static const NSString *kDisbursalAmount		= @"disbursal_amount";
static const NSString *kDisbursalCurrency	= @"disbursal_currency";
static const NSString *kDisbursalDate		= @"disbursal_date";
static const NSString *kLocalPayments		= @"local_payments";
static const NSString *kLossLiability		= @"loss_liability";
static const NSString *kRepaymentInterval	= @"repayment_interval";
static const NSString *kRepaymentTerm		= @"repayment_term";
static const NSString *kScheduledPayments	= @"scheduled_payments";

//Loan Status Values
static const NSString *kFundraising			= @"fundraising";
static const NSString *kFunded				= @"funded";
static const NSString *kInRepayment			= @"in_repayment";
static const NSString *kPaid				= @"paid";
static const NSString *kDefaulted			= @"defaulted";
static const NSString *kRefuned				= @"refunded";

@implementation KivaLoan

- (id)initWithDictionary:(NSDictionary *)dictionary detailed:(BOOL)detailed {
	if (self = [super init]) {
		_detailed = detailed;
	}
	
	return [self initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
	_loanId = [NSNumber numberWithLong:[[dictionary objectForKey:kLoanId] longValue]];
	_name = [dictionary objectForKey:kName];
	
	NSDictionary *description = [dictionary objectForKey:kDescription];
	if (description) {
		_languages = [[NSArray alloc] initWithArray:[description objectForKey:kLanguages]];
	} else {
		_languages = [[NSArray alloc] init];
	}
	
	_status = [KivaLoan loanStatusFromString:[dictionary objectForKey:kStatus]];
	_fundedAmount = [NSNumber numberWithFloat:[[dictionary objectForKey:kFundedAmount] floatValue]];
	_basketAmount = [NSNumber numberWithFloat:[[dictionary objectForKey:kBasketAmount] floatValue]];
	_image = [[KivaImage alloc] initWithDictionary:[dictionary objectForKey:kImage]];
	_activity = [dictionary objectForKey:kActivity];
	_sector = [dictionary objectForKey:kSector];
	_use = [dictionary objectForKey:kUse];
	_theme = [dictionary objectForKey:kTheme];
	_location = [[KivaLocation alloc] initWithDictionary:[dictionary objectForKey:kLocation]];
	_partnerId = [[NSNumber alloc] initWithLong:[[dictionary objectForKey:kPartnerId] longValue]];
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
	_postedDate = [formatter dateFromString:[dictionary objectForKey:kPostedDate]];
	_plannedExpirationDate = [formatter dateFromString:[dictionary objectForKey:kPlannedEndDate]];
	
	_loanAmount = [NSNumber numberWithFloat:[[dictionary objectForKey:kLoanAmount] floatValue]];
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
	_video = [[KivaVideo alloc] initWithDictionary:[dictionary objectForKey:kVideo]];
	_journalEntries = [NSNumber numberWithInt:[[[dictionary objectForKey:kJournalEntries] objectForKey:kJournalEntries] intValue]];
	
	/*
	 *	DETAILED LOAN ONLY FIELDS
	 */
	
	NSArray *b = [dictionary objectForKey:kBorrowers];
	NSMutableArray *borrowerValues = [[NSMutableArray alloc] init];
	
	if (b) {
		for (NSDictionary *d in b) {
			[borrowerValues addObject:[[KivaBorrower alloc] initWithDictionary:d]];
		}
	}
	
	_borrowers = [NSArray arrayWithArray:borrowerValues];
	_descriptionText = [[[dictionary objectForKey:kDescription] objectForKey:kDescriptionText] objectForKey:@"en"];
	
	NSArray *payment = [dictionary objectForKey:kPayments];
	NSMutableArray *paymentValues = [[NSMutableArray alloc] init];
	
	if (payment) {
		for (NSDictionary *d in payment) {
			[paymentValues addObject:[[KivaPayment alloc] initWithDictionary:d]];
		}
	}
	
	_payments = [NSArray arrayWithArray:paymentValues];
	
	NSDictionary *terms = [dictionary objectForKey:kTerms];
	_disbursalAmount = [NSNumber numberWithFloat:[[terms objectForKey:kDisbursalAmount] floatValue]];
	_disbursalCurrency = [terms objectForKey:kDisbursalCurrency];
	_disbursalDate = [formatter dateFromString:[terms objectForKey:kDisbursalDate]];

	NSArray *lPayments = [terms objectForKey:kLocalPayments];
	NSMutableArray *lPaymentValues = [[NSMutableArray alloc] init];
	
	if (lPayments) {
		for (NSDictionary *d in lPayments) {
			[lPaymentValues addObject:[[KivaLocalPayment alloc] initWithDictionary:d]];
		}
	}
	
	_localPayments = [NSArray arrayWithArray:lPaymentValues];
	_lossLiability = [[KivaLossLiability alloc] initWithDictionary:[terms objectForKey:kLossLiability]];
	_repaymentInterval = [terms objectForKey:kRepaymentInterval];
	_repaymentTerm = [NSNumber numberWithInt:[[terms objectForKey:kRepaymentTerm] intValue]];
	
	NSArray *scheduled = [terms objectForKey:kScheduledPayments];
	NSMutableArray *scheduledValues = [[NSMutableArray alloc] init];
	
	if (scheduled) {
		for (NSDictionary *d in scheduled) {
			[scheduledValues addObject:[[KivaScheduledPayment alloc] initWithDictionary:d]];
		}
	}
	
	_scheduledPayments = [NSArray arrayWithArray:scheduledValues];
	
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
	if (!_detailed) {
		return [NSString stringWithFormat:@"KivaLoan[loanId = %d, name = %@, status = %ld, fundedAmount = %d, basketAmount = %d, image = %@, activity = %@, sector = %@, use = %@, theme = %@, location = %@, partnerId = %d, postedDate = %@, plannedEndDate = %@, loanAmount = %d, borrowerCount = %d, lenderCount = %d, video = %@]",
				[_loanId intValue],
				_name,
				_status,
				[_fundedAmount intValue],
				[_basketAmount intValue],
				_image,
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
				[_lenderCount intValue],
				_video];
	}
	
	return [NSString stringWithFormat:@"KivaLoan[loanId = %d, name = %@, status = %ld, fundedAmount = %d, basketAmount = %d, image = %@, activity = %@, sector = %@, use = %@, theme = %@, location = %@, partnerId = %d, postedDate = %@, plannedEndDate = %@, loanAmount = %d, borrowerCount = %d, lenderCount = %d, video = %@, detailed = %d, borrowers = %@, descriptionText = %@, journalEntries = %d, payments = %@, disbursalAmount = %f, disbursalCurrency = %@, disbursalDate = %@, localPayments = %@, lossLiability = %@, repaymentInterval = %@, repaymentTerm = %d, scheduledPayments = %@]",
			[_loanId intValue],
			_name,
			_status,
			[_fundedAmount intValue],
			[_basketAmount intValue],
			_image,
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
			[_lenderCount intValue],
			_video,
			_detailed,
			_borrowers,
			_descriptionText,
			[_journalEntries intValue],
			_payments,
			[_disbursalAmount floatValue],
			_disbursalCurrency,
			_disbursalDate,
			_localPayments,
			_lossLiability,
			_repaymentInterval,
			[_repaymentTerm intValue],
			_scheduledPayments];
}

@end
