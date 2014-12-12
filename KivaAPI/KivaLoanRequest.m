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

- (id)initWithRequestType:(LoanRequestType)requestType {
	if (self = [super init]) {
		_requestType = requestType;
	}
	
	return self;
}

- (id)addObjects:(NSArray *)valueObjects {
	objects = [[NSMutableArray alloc] initWithArray:valueObjects];
	return self;
}

- (NSURLRequest *)urlRequest {
	switch ([self requestType]) {
		case kNewestLoansRequest:
			return [self newestLoansRequestUrl];
			break;
		case kLoanDetails:
			return [self loanDetailsRequestUrl];
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

- (NSURLRequest *)loanDetailsRequestUrl {
	if ([[KivaRequestManager appID] isEqualToString:@""]) {
		return [self urlRequestFromString:[apiUrlString stringByAppendingFormat:@"%@.%@",
										   [self listObjects],
										   jsonFormat]];
	}
	
	return [self urlRequestFromString:[apiUrlString stringByAppendingFormat:@"%@.%@?%@=%@",
									   [self listObjects],
									   jsonFormat,
									   appId,
									   [KivaRequestManager appID]]];
}

#pragma mark - Helper Methods

- (NSString *)listObjects {
	NSString *value = @"";
	NSString *delimeter = @"";
	
	if ([self requestType] == kLoanDetails) {
		for (NSObject *o in objects) {
			if ([o isKindOfClass:[NSNumber class]]) {
				value = [value stringByAppendingFormat:@"%@%d", delimeter, [((NSNumber *)o) intValue]];
			} else if ([o isKindOfClass:[NSString class]]) {
				value = [value stringByAppendingFormat:@"%@%@", delimeter, o];
			}
			
			delimeter = @",";
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

#pragma mark - Requests

+ (instancetype)newestLoans {
	return [[KivaLoanRequest alloc] initWithRequestType:kNewestLoansRequest];
}

+ (instancetype)loanDetails:(NSNumber *)loanId {
	return [[[KivaLoanRequest alloc] initWithRequestType:kLoanDetails] addObjects:[NSArray arrayWithObjects:loanId, nil]];
}

// API supports up to 100 loans
+ (instancetype)multipleLoanDetails:(NSArray *)loanIds {
	NSAssert(loanIds.count < 100, @"API only supports up max 100 loan items");
	return [[[KivaLoanRequest alloc] initWithRequestType:kLoanDetails] addObjects:loanIds];
}

@end
