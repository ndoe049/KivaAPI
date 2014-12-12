//
//  KivaLoanRequest.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/6/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LoanRequestType) {
	kNewestLoansRequest,
	kLoanDetails
};

@interface KivaLoanRequest : NSObject {
	NSMutableArray *objects;
}

@property (nonatomic, readonly) LoanRequestType requestType;

+ (instancetype)newestLoans;
+ (instancetype)loanDetails:(NSNumber *)loanId;
+ (instancetype)multipleLoanDetails:(NSArray *)loanIds;

- (NSURLRequest *)urlRequest;

@end
