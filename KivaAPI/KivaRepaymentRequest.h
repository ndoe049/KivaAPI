//
//  KivaRepaymentRequest.h
//  KivaAPI
//
//  Created by Nathan Doe on 1/10/15.
//  Copyright (c) 2015 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KivaRepaymentRequest : NSObject {
	NSMutableArray *objects;
}

+ (instancetype)repaymentsForLoanId:(NSNumber *)loanId;

- (NSURLRequest *)urlRequest;

@end
