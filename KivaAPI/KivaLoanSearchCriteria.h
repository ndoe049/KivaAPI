//
//  KivaLoanSearchCriteria.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/15/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//
// http://build.kiva.org/api#GET*|loans|search

#import <Foundation/Foundation.h>
#import "KivaBorrower.h"
#import "KivaSearchConstants.h"

@interface KivaLoanSearchCriteria : NSObject

@property (nonatomic, readonly) NSMutableArray *values;

- (void)status:(const NSString *)status;
- (void)gender:(Gender)gender;
- (void)region:(const NSString *)region;
- (void)regions:(NSArray *)regions;
- (void)country:(const NSString *)country;
- (void)countries:(NSArray *)countries;
- (void)sector:(const NSString *)sector;
- (void)sectors:(NSArray *)sectors;
- (void)partner:(NSNumber *)partnerId;
- (void)partners:(NSArray *)partnerIds;
- (void)theme:(const NSString *)theme;
- (void)themes:(NSArray *)themes;
- (void)borrowerType:(const NSString *)borrowerType;
- (void)partnerMinRiskRating:(NSNumber *)minRiskRating;
- (void)partnerMaxRiskRating:(NSNumber *)maxRiskRating;
- (void)partnerMinArrears:(NSNumber *)minArrears;
- (void)partnerMaxArrears:(NSNumber *)maxArrears;
- (void)partnerMinDefault:(NSNumber *)minDefault;
- (void)partnerMaxDefault:(NSNumber *)maxDefault;
- (void)includeUnratedPartners:(BOOL)includeUnrated;
- (void)includeCurrnecyRiskPartners:(BOOL)includeCurrencyRisk;
- (void)returnIdsOnly:(BOOL)idsOnly;

- (void)sortByField:(NSString *)sortParam;
- (void)sortByFields:(NSArray *)sortParams;

- (void)query:(NSString *)query;
- (void)page:(NSNumber *)pageNumber;
- (void)loansPerPage:(NSNumber *)loansPerPage;

- (NSString *)build;

- (BOOL)isOnlyIds;

@end
