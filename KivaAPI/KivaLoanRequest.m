//
//  KivaLoanRequest.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/6/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaLoanRequest.h"
#import "KivaRequestManager.h"

static const NSString *apiUrlString		= @"http://api.kivaws.org/v1/loans/";
static const NSString *newestApiPath	= @"newest";
static const NSString *jsonFormat		= @"json";
static const NSString *appId			= @"app_id";

@implementation KivaLoanRequest

#pragma mark - Public methods 

- (id)initWithRequestType:(LoanRequestType) requestType {
	if (self = [super init]) {
		_requestType = requestType;
	}
	
	return self;
}

- (NSURLRequest *)urlRequest {
	switch ([self requestType]) {
		case kNewestLoansRequest:
			return [self newestLoansRequestUrl];
			break;
		default:
			break;
	}
	
	return nil;
}

#pragma mark - NSURLRequestConstruction methods 

- (NSURLRequest *)newestLoansRequestUrl {
	if ([[KivaRequestManager appID] isEqualToString:@""]) {
		return [self urlRequestFromString:[apiUrlString stringByAppendingFormat:@"%@.%@",
										   newestApiPath,
										   jsonFormat]];
	}
	
	return [self urlRequestFromString:[apiUrlString stringByAppendingFormat:@"%@.%@?%@=%@",
									   newestApiPath,
									   jsonFormat,
									   appId,
									   [KivaRequestManager appID]]];
}

- (NSURLRequest *)urlRequestFromString:(NSString *)string {
	string = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	string = [string stringByReplacingOccurrencesOfString:@"(null)"
											   withString:@""];
	NSLog(@"Request String: %@", string);
	return [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
}

#pragma mark - Requests

+ (instancetype)newestLoans {
	return [[KivaLoanRequest alloc] initWithRequestType:kNewestLoansRequest];
}

@end
