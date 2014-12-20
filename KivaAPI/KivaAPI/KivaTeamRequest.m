//
//  KivaTeamRequest.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/20/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaTeamRequest.h"
#import "KivaRequestManager.h"

static const NSString *kApiUrlString		= @"http://api.kivaws.org/v1/loans/";
static const NSString *kApiPath				= @"/teams.json";

@implementation KivaTeamRequest

- (id)initWithRequestType:(TeamRequestType)requestType objects:(NSArray *)valueObjects {
	if (self = [super init]) {
		_requestType = requestType;
		objects = [NSMutableArray arrayWithArray:valueObjects];
	}
	
	return self;
}

- (NSURLRequest *)urlRequest {
	return [self teamsForLoanRequest];
}

#pragma mark - NSURLRequestConstruction methods

- (NSURLRequest *)teamsForLoanRequest {
	if ([[KivaRequestManager appID] isEqualToString:@""]) {
		return [self urlRequestFromString:[kApiUrlString stringByAppendingFormat:@"%@%@",
										   [self listObjects],
										   kApiPath]];
	}
	
	return [self urlRequestFromString:[kApiUrlString stringByAppendingFormat:@"%@%@?%@=%@",
									   [self listObjects],
									   kApiPath,
									   kAppId,
									   [KivaRequestManager appID]]];
}

#pragma mark - Helper Methods

- (NSString *)listObjects {
	NSString *value = @"";
	
	if ([self requestType] == LOAN_TEAMS) {
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

+ (instancetype)teamsForLoanId:(NSNumber *)loanId {
	return [[KivaTeamRequest alloc] initWithRequestType:LOAN_TEAMS objects:[NSArray arrayWithObjects:loanId, nil]];
}

@end
