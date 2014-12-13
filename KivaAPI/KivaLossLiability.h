//
//  KivaLossLiability.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/13/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FromJSON.h"

typedef NS_ENUM(NSInteger, LiabilityCurrencyExchange) {
	SHARED,
	PARTNER,
	NONE
};

typedef NS_ENUM(NSInteger, Nonpayment) {
	LENDER_LIABLE,
	PARTNER_LIABLE
};

@interface KivaLossLiability : NSObject <FromJSON>

@property (nonatomic, readonly) LiabilityCurrencyExchange currencyExchange;
@property (nonatomic, readonly) NSNumber *currencyExchangeCoverageRate;
@property (nonatomic, readonly) Nonpayment nonpaymentLiability;

@end
