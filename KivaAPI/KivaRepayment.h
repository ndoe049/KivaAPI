//
//  KivaRepayment.h
//  KivaAPI
//
//  Created by Nathan Doe on 1/10/15.
//  Copyright (c) 2015 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FromJSON.h"

@interface KivaRepayment : NSObject <FromJSON>

@property (nonatomic, readonly) NSString *comment;
@property (nonatomic, readonly) NSNumber *actualRepayment;
@property (nonatomic, readonly) NSNumber *currencyExchangeLoss;
@property (nonatomic, readonly) NSNumber *expectedRepayment;
@property (nonatomic, readonly) NSDate *period;
@property (nonatomic, readonly) NSString *repaymentStatus;

@end