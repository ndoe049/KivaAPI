//
//  KivaRepaymentRequest.m
//  KivaAPI
//
//  Created by Nathan Doe on 1/10/15.
//  Copyright (c) 2015 Nathaniel Doe. All rights reserved.
//

#import "KivaRepaymentRequest.h"
#import "KivaRequestManager.h"

static const NSString *kApiUrlString	= @"http://api.kivaws.org/v1/loans/";
static const NSString *kRepaymentPath	= @"/repayments";
static const NSString *kJsonFormat		= @"json";
static const NSString *kIdsOnly			= @"ids_only";

@implementation KivaRepaymentRequest

- (id)initWithObjects:(NSArray *)valueObjects {
	if (self = [super init]) {
		objects = [NSMutableArray arrayWithArray:valueObjects];
	}
	
	return self;
}

- (NSURLRequest *)urlRequest {
	return [self repaymentsForLoanRequest];
}

#pragma mark - NSURLRequestConstruction methods

- (NSURLRequest *)repaymentsForLoanRequest {
	if ([[KivaRequestManager appID] isEqualToString:@""]) {
		return [self urlRequestFromString:[kApiUrlString stringByAppendingFormat:@"%@%@.%@",
										   [self listObjects],
										   kRepaymentPath,
										   kJsonFormat]];
	}

	return [self urlRequestFromString:[kApiUrlString stringByAppendingFormat:@"%@%@.%@?%@=%@",
									   [self listObjects],
									   kRepaymentPath,
									   kJsonFormat,
									   kAppId,
									   [KivaRequestManager appID]]];
}

#pragma mark - Helper Methods

- (NSString *)listObjects {
	NSString *value = @"";
	
	for (NSObject *o in objects) {
		if ([o isKindOfClass:[NSNumber class]]) {
			value = [value stringByAppendingFormat:@"%d", [((NSNumber *)o) intValue]];
			break;
		}
	}
	return value;
}

- (NSURLRequest *)urlRequestFromString:(NSString *)string {
	string = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	string = [string stringByReplacingOccurrencesOfString:@"(null)"
											   withString:@""];
	NSLog(@"Request String: %@", string);
	return [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
}

#pragma mark -

+ (instancetype)repaymentsForLoanId:(NSNumber *)loanId {
	return [[KivaRepaymentRequest alloc] initWithObjects:[NSArray arrayWithObjects:loanId, nil]];
}

@end
