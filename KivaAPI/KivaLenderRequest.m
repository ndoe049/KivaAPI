//
//  KivaLenderRequest.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/14/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaLenderRequest.h"

static const NSString *kApiUrlString	= @"http://api.kivaws.org/v1/loans/";
static const NSString *kJsonFormat		= @"json";
static const NSString *kLenders			= @"lenders";

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
		default:
			break;
	}
	
	return request;
}

#pragma mark - NSURLRequestConstruction methods

- (NSURLRequest *)loanLendersRequestUrl {
	return [self urlRequestFromString:[kApiUrlString stringByAppendingFormat:@"%@/%@.%@",
									   [self listObjects],
									   kLenders,
									   kJsonFormat]];
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

+ (instancetype)lendersForLoan:(NSNumber *)loanId {
	return [[KivaLenderRequest alloc] initWithRequestType:LOAN_LENDERS objects:[NSArray arrayWithObjects:loanId, nil]];
}

@end
