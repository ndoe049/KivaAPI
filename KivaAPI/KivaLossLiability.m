//
//  KivaLossLiability.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/13/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaLossLiability.h"

static const NSString *kCurrencyExchange				= @"currency_exchange";
static const NSString *kCurrencyExchangeCoverageRate	= @"currency_exchange_coverage_rate";
static const NSString *kNonpayment						= @"nonpayment";

static const NSString *kLender							= @"lender";
static const NSString *kParner							= @"partner";
static const NSString *kNone							= @"none";
static const NSString *kShared							= @"shared";

@implementation KivaLossLiability

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_currencyExchange = [self getCurrencyExchangeForValue:[dictionary objectForKey:kCurrencyExchange]];
		_currencyExchangeCoverageRate = [NSNumber numberWithFloat:[[dictionary objectForKey:kCurrencyExchangeCoverageRate] floatValue]];
		_nonpaymentLiability = [self getNonpaymentForValue:[dictionary objectForKey:kNonpayment]];
	}
	
	return self;
}

- (LiabilityCurrencyExchange)getCurrencyExchangeForValue:(NSString *)value {
	if ([kShared isEqualToString:value]) {
		return SHARED;
	} else if ([kParner isEqualToString:value]) {
		return PARTNER;
	}
	
	return NONE;
}

- (Nonpayment)getNonpaymentForValue:(NSString *)value {
	if ([kLender isEqualToString:value]) {
		return LENDER_LIABLE;
	}
	
	return PARTNER_LIABLE;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaLossLiability[currencyExchange = %ld, currencyExchangeCoverageRate = %f, nonpayment = %ld]",
			_currencyExchange,
			[_currencyExchangeCoverageRate doubleValue],
			_nonpaymentLiability];
}

@end
