//
//  KivaLoan.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/7/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//
//  Loan model documentation: http://build.kiva.org/docs/data/loans


#import <Foundation/Foundation.h>
#import "FromJSON.h"

@class KivaLocation, KivaImage, KivaVideo;

typedef NS_ENUM(NSInteger, LoanStatus) {
	FUNDRAISING,
	FUNDED,
	IN_REPAYMENT,
	PAID,
	DEFAULTED,
	REFUNDED
};

@interface KivaLoan : NSObject <FromJSON>

@property (nonatomic, readonly) NSNumber *loanId;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSArray *languages;
@property (nonatomic, readonly) LoanStatus status;
@property (nonatomic, readonly) NSNumber *fundedAmount;
@property (nonatomic, readonly) NSNumber *basketAmount;
@property (nonatomic, readonly) KivaImage *image;
@property (nonatomic, readonly) NSString *activity;
@property (nonatomic, readonly) NSString *sector;
@property (nonatomic, readonly) NSString *use;
@property (nonatomic, readonly) NSString *theme;
@property (nonatomic, readonly) KivaLocation *location;
@property (nonatomic, readonly) NSNumber *partnerId;
@property (nonatomic, readonly) NSDate *postedDate;
@property (nonatomic, readonly) NSDate *plannedExpirationDate;
@property (nonatomic, readonly) NSNumber *loanAmount;
@property (nonatomic, readonly) NSNumber *borrowerCount;
@property (nonatomic, readonly) NSNumber *lenderCount;
@property (nonatomic, getter = isBonusCreditEligible) BOOL bonusCreditElibibility;
@property (nonatomic, readonly) NSArray *tags;
@property (nonatomic, readonly) KivaVideo *video;

@property (nonatomic, readonly) NSArray *borrowers;
@property (nonatomic, readonly) NSString *descriptionText;
@property (nonatomic, readonly) NSNumber *journalEntries;
@property (nonatomic, readonly) NSArray *payments;

@property (nonatomic, getter = isDetailed) BOOL detailed;

+ (LoanStatus)loanStatusFromString:(NSString *)value;

- (id)initWithDictionary:(NSDictionary *)dictionary detailed:(BOOL)detailed;

@end
