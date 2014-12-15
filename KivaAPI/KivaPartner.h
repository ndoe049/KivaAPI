//
//  KivaPartner.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/13/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FromJSON.h"

@class KivaImage;

@interface KivaPartner : NSObject <FromJSON>

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) NSNumber *averageLoanSizePercentPerCapitaIncome;
@property (nonatomic, getter = doesChargeFeesAndInterest) BOOL chargesFeesAndInterest;
@property (nonatomic, readonly) NSArray *countries;
@property (nonatomic, readonly) NSNumber *currencyExchangeLossRate;
@property (nonatomic, readonly) NSNumber *defaultRate;
@property (nonatomic, readonly) NSString *defaultRateNote;
@property (nonatomic, readonly) NSNumber *delinquencyRate;
@property (nonatomic, readonly) NSString *delinquencyRateNote;
@property (nonatomic, readonly) NSNumber *partnerId;
@property (nonatomic, readonly) KivaImage *image;
@property (nonatomic, readonly) NSNumber *loansAtRiskRate;
@property (nonatomic, readonly) NSNumber *loansPosted;
@property (nonatomic, readonly) NSString *portfolioYieldNote;
@property (nonatomic, readonly) NSString *rating;
@property (nonatomic, readonly) NSDate *startDate;
@property (nonatomic, readonly) NSString *status;
@property (nonatomic, readonly) NSNumber *totalAmountRaised;

@end
