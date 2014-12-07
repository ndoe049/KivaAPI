//
//  KivaLoanRequest.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/6/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LoanRequestType) {
	kNewestLoansRequest
};

@interface KivaLoanRequest : NSObject

@property (nonatomic) LoanRequestType requestType;

+ (instancetype)newestLoans;

- (NSURLRequest *)urlRequest;

@end
