//
//  KivaPayment.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/12/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FromJSON.h"

@interface KivaPayment : NSObject <FromJSON>

@property (nonatomic, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSString *comment;
@property (nonatomic, readonly) NSNumber *currencyExchangeLossAmount;
@property (nonatomic, readonly) NSNumber *localAmount;
@property (nonatomic, readonly) NSNumber *paymentId;
@property (nonatomic, readonly) NSNumber *roundedLocalAmount;
@property (nonatomic, readonly) NSDate *processedDate;
@property (nonatomic, readonly) NSDate *settlementDate;

@end
