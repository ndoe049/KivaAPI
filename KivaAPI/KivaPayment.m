//
//  KivaPayment.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/12/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaPayment.h"

static const NSString *kAmount				= @"amount";
static const NSString *kComment				= @"comment";
static const NSString *kCurrencyExchange	= @"currency_exchange_loss_amount";
static const NSString *kLocalAmount			= @"local_amount";
static const NSString *kPaymentId			= @"payment_id";
static const NSString *kProccessedDate		= @"processed_date";
static const NSString *kRounedLocalAmount	= @"rounded_local_amount";
static const NSString *kSettlementDate		= @"settlement_date";

@implementation KivaPayment

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_amount = [NSNumber numberWithFloat:[[dictionary objectForKey:kAmount] floatValue]];
		_comment = [dictionary objectForKey:kComment];
		_currencyExchangeLossAmount = [NSNumber numberWithFloat:[[dictionary objectForKey:kCurrencyExchange] floatValue]];
		_localAmount = [NSNumber numberWithFloat:[[dictionary objectForKey:kLocalAmount] floatValue]];
		_paymentId = [NSNumber numberWithLong:[[dictionary objectForKey:kPaymentId] longValue]];
		_roundedLocalAmount = [NSNumber numberWithDouble:[[dictionary objectForKey:kRounedLocalAmount] doubleValue]];
		
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
		_processedDate = [formatter dateFromString:[dictionary objectForKey:kProccessedDate]];
		_settlementDate	= [formatter dateFromString:[dictionary objectForKey:kSettlementDate]];
	}
	
	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaPayment[amount = %f, comment = %@, currencyExchangeLossAmount = %f, localAmount = %f, paymentId = %d, roundedLocalAmount = %f, processedDate = %@, settlementDate = %@]",[_amount floatValue],
			_comment,
			[_currencyExchangeLossAmount floatValue],
			[_localAmount floatValue],
			[_paymentId intValue],
			[_roundedLocalAmount doubleValue],
			_processedDate,
			_settlementDate];
}

@end
