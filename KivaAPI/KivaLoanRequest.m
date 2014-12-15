//
//  KivaLoanRequest.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/6/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaLoanRequest.h"
#import "KivaRequestManager.h"

static const NSString *kApiUrlString	= @"http://api.kivaws.org/v1/loans/";
static const NSString *kNewestApiPath	= @"newest";
static const NSString *kJsonFormat		= @"json";
static const NSString *kAppId			= @"app_id";
static const NSString *kSimilar			= @"similar";
static const NSString *kSearch			= @"search";

@implementation KivaLoanRequest

#pragma mark - Public methods 

- (id)initWithRequestType:(LoanRequestType)requestType objects:(NSArray *)valueObjects {
	if (self = [super init]) {
		_requestType = requestType;
		objects = [NSMutableArray arrayWithArray:valueObjects];
	}
	
	return self;
}

- (NSURLRequest *)urlRequest {
	NSURLRequest *request = nil;
	switch ([self requestType]) {
		case NEWEST_LOANS:
			request = [self newestLoansRequestUrl];
			break;
		case LOAN_DETAILS:
			request = [self loanDetailsRequestUrl];
			break;
		case SIMILAR:
			request = [self similarLoansRequestUrl];
			break;
		case SEARCH_CRITERIA:
			request = [self serachRequestUrl];
			break;
		default:
			break;
	}
	
	return request;
}

#pragma mark - NSURLRequestConstruction methods 

- (NSURLRequest *)newestLoansRequestUrl {
	if ([[KivaRequestManager appID] isEqualToString:@""]) {
		return [self urlRequestFromString:[kApiUrlString stringByAppendingFormat:@"%@.%@",
										   kNewestApiPath,
										   kJsonFormat]];
	}
	
	return [self urlRequestFromString:[kApiUrlString stringByAppendingFormat:@"%@.%@?%@=%@",
									   kNewestApiPath,
									   kJsonFormat,
									   kAppId,
									   [KivaRequestManager appID]]];
}

- (NSURLRequest *)loanDetailsRequestUrl {
	if ([[KivaRequestManager appID] isEqualToString:@""]) {
		return [self urlRequestFromString:[kApiUrlString stringByAppendingFormat:@"%@.%@",
										   [self listObjects],
										   kJsonFormat]];
	}
	
	return [self urlRequestFromString:[kApiUrlString stringByAppendingFormat:@"%@.%@?%@=%@",
									   [self listObjects],
									   kJsonFormat,
									   kAppId,
									   [KivaRequestManager appID]]];
}

- (NSURLRequest *)similarLoansRequestUrl {
	return [self urlRequestFromString:[kApiUrlString stringByAppendingFormat:@"%@/%@.%@",
									   [self listObjects],
									   kSimilar,
									   kJsonFormat]];
}

- (NSURLRequest *)serachRequestUrl {
	return [self urlRequestFromString:[kApiUrlString stringByAppendingFormat:@"%@.%@?%@",
									   kSearch,
									   kJsonFormat,
									   [self listObjects]]];
}

#pragma mark - Helper Methods

- (NSString *)listObjects {
	NSString *value = @"";
	NSString *delimeter = @"";

	if ([self requestType] == LOAN_DETAILS) {
		for (NSObject *o in objects) {
			if ([o isKindOfClass:[NSNumber class]]) {
				value = [value stringByAppendingFormat:@"%@%d", delimeter, [((NSNumber *)o) intValue]];
			} else if ([o isKindOfClass:[NSString class]]) {
				value = [value stringByAppendingFormat:@"%@%@", delimeter, o];
			}
			
			delimeter = @",";
		}
	} else if ([self requestType] == SIMILAR) {
		for (NSObject *o in objects) {
			if ([o isKindOfClass:[NSNumber class]]) {
				value = [value stringByAppendingFormat:@"%d",[((NSNumber *)o) intValue]];
			}
		}
	} else if ([self requestType] == SEARCH_CRITERIA) {
		for (NSObject *o in objects) {
			if ([o isKindOfClass:[KivaLoanSearchCriteria class]]) {
				value = [(KivaLoanSearchCriteria *)o build];
				break;
			}
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
	return [[KivaLoanRequest alloc] initWithRequestType:NEWEST_LOANS objects:nil];
}

+ (instancetype)loanDetails:(NSNumber *)loanId {
	return [[KivaLoanRequest alloc] initWithRequestType:LOAN_DETAILS objects:[NSArray arrayWithObjects:loanId, nil]];
}

// API supports up to 100 loans
+ (instancetype)multipleLoanDetails:(NSArray *)loanIds {
	NSAssert(loanIds.count < 100, @"API only supports up max 100 loan items");
	return [[KivaLoanRequest alloc] initWithRequestType:LOAN_DETAILS objects:loanIds];
}

+ (instancetype)similarLoans:(NSNumber *)loanId {
	return [[KivaLoanRequest alloc] initWithRequestType:SIMILAR objects:[NSArray arrayWithObjects:loanId, nil]];
}

+ (instancetype)search:(KivaLoanSearchCriteria *)criteria {
	return [[KivaLoanRequest alloc] initWithRequestType:SEARCH_CRITERIA objects:[NSArray arrayWithObjects:criteria, nil]];
}

@end
