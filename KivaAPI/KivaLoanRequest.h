//
//  KivaLoanRequest.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/6/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KivaLoanSearchCriteria.h"

typedef NS_ENUM(NSInteger, LoanRequestType) {
	NEWEST_LOANS,
	LOAN_DETAILS,
	SIMILAR,
	SEARCH_CRITERIA
};

@interface KivaLoanRequest : NSObject {
	NSMutableArray *objects;
}

@property (nonatomic, readonly) LoanRequestType requestType;
@property (nonatomic, readonly) KivaLoanSearchCriteria *criteria;

+ (instancetype)newestLoans;
+ (instancetype)loanDetails:(NSNumber *)loanId;
+ (instancetype)multipleLoanDetails:(NSArray *)loanIds;
+ (instancetype)similarLoans:(NSNumber *)loanId;
+ (instancetype)search:(KivaLoanSearchCriteria *)criteria;

- (NSURLRequest *)urlRequest;

@end
