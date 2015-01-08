//
//  KivaLenderRequest.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/14/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaLenderRequest.h"
#import "KivaRequestManager.h"

static const NSString *kLendersApiUrlString	= @"http://api.kivaws.org/v1/lenders/newest";
static const NSString *kLoanApiUrlString	= @"http://api.kivaws.org/v1/loans/";
static const NSString *kJsonFormat			= @"json";
static const NSString *kLenders				= @"lenders";

@implementation KivaLenderRequest

- (id)initWithRequestType:(LenderRequestType)requestType objects:(NSArray *)valueObjects {
	if (self = [super init]) {
		_requestType = requestType;
		objects = [NSMutableArray arrayWithArray:valueObjects];
	}
	
	return self;
}

- (NSURLRequest *)urlRequest {
	NSURLRequest *request = nil;
	switch ([self requestType]) {
		case LOAN_LENDERS:
			request = [self loanLendersRequestUrl];
			break;
		case NEWEST:
			request = [self newsetRequestUrl];
		default:
			break;
	}
	
	return request;
}

#pragma mark - NSURLRequestConstruction methods

- (NSURLRequest *)loanLendersRequestUrl {
	if ([[KivaRequestManager appID] isEqualToString:@""]) {
		return [self urlRequestFromString:[kLoanApiUrlString stringByAppendingFormat:@"%@/%@.%@",
										   [self listObjects],
										   kLenders,
										   kJsonFormat]];
	}
	
	return [self urlRequestFromString:[kLoanApiUrlString stringByAppendingFormat:@"%@/%@.%@?%@=%@",
									   [self listObjects],
									   kLenders,
									   kJsonFormat,
									   kAppId,
									   [KivaRequestManager appID]]];
}

- (NSURLRequest *)newsetRequestUrl {
	if ([[KivaRequestManager appID] isEqualToString:@""]) {
		return [self urlRequestFromString:[kLendersApiUrlString stringByAppendingFormat:@".%@",
										   kJsonFormat]];
	}
	
	return [self urlRequestFromString:[kLendersApiUrlString stringByAppendingFormat:@".%@?%@=%@",
									   kJsonFormat,
									   kAppId,
									   [KivaRequestManager appID]]];
}

#pragma mark - Helper Methods

- (NSString *)listObjects {
	NSString *value = @"";
	
	if ([self requestType] == LOAN_LENDERS) {
		for (NSObject *o in objects) {
			if ([o isKindOfClass:[NSNumber class]]) {
				value = [value stringByAppendingFormat:@"%d", [((NSNumber *)o) intValue]];
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

+ (instancetype)lendersForLoanId:(NSNumber *)loanId {
	return [[KivaLenderRequest alloc] initWithRequestType:LOAN_LENDERS objects:[NSArray arrayWithObjects:loanId, nil]];
}

+ (instancetype)newestLenders {
	return [[KivaLenderRequest alloc] initWithRequestType:NEWEST objects:nil];
}

@end
