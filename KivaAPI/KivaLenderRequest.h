//
//  KivaLenderRequest.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/14/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LenderRequestType) {
	LOAN_LENDERS,
	LENDER_DETAILS
};

@interface KivaLenderRequest : NSObject {
	NSMutableArray *objects;
}

@property (nonatomic, readonly) LenderRequestType requestType;

+ (instancetype)lendersForLoan:(NSNumber *)loanId;

- (NSURLRequest *)urlRequest;

@end
