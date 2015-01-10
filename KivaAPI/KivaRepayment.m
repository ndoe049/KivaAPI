//
//  KivaRepayment.m
//  KivaAPI
//
//  Created by Nathan Doe on 1/10/15.
//  Copyright (c) 2015 Nathaniel Doe. All rights reserved.
//

#import "KivaRepayment.h"

static const NSString *kComment					= @"comment";
static const NSString *kActualRepayment			= @"actual_repayment";
static const NSString *kCurrencyExchangeLoss	= @"currency_exchange_loss";
static const NSString *kExpectedRepayment		= @"expected_repayment";
static const NSString *kPeriodHuman				= @"period_human";
static const NSString *kRepaymentStatus			= @"repayment_status";

@implementation KivaRepayment

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_comment = [dictionary objectForKey:kComment];
		_actualRepayment = [NSNumber numberWithFloat:[[dictionary objectForKey:kActualRepayment] floatValue]];
		_currencyExchangeLoss = [NSNumber numberWithFloat:[[dictionary objectForKey:kCurrencyExchangeLoss] floatValue]];
		_expectedRepayment = [NSNumber numberWithFloat:[[dictionary objectForKey:kExpectedRepayment] floatValue]];
		_repaymentStatus = [dictionary objectForKey:kRepaymentStatus];
		
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
		_period = [formatter dateFromString:[dictionary objectForKey:kPeriodHuman]];
	}
	
	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaRepayment[comment = %@, actualRepayment = %f, currencyExchangeLoss = %f, expectedRepayment = %f, repaymentStatus = %@, period = %@]", _comment,
			[_actualRepayment floatValue],
			[_currencyExchangeLoss floatValue],
			[_expectedRepayment floatValue],
			_repaymentStatus,
			_period];
}

@end
