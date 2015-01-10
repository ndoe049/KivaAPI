//
//  KivaTeamRequest.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/20/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaTeamRequest.h"
#import "KivaRequestManager.h"

static const NSString *kLoansApiUrlString		= @"http://api.kivaws.org/v1/loans/";
static const NSString *kLenderApiUrlString		= @"http://api.kivaws.org/v1/lenders/";
static const NSString *kShortnameApiUrlString	= @"http://api.kivaws.org/v1/teams/using_shortname/";
static const NSString *kApiPath					= @"/teams.json";
static const NSString *kIdsOnly					= @"ids_only";
static const NSString *kJsonFormat				= @"json";

@implementation KivaTeamRequest

- (id)initWithRequestType:(TeamRequestType)requestType objects:(NSArray *)valueObjects {
	if (self = [super init]) {
		_requestType = requestType;
		objects = [NSMutableArray arrayWithArray:valueObjects];
	}
	
	return self;
}

- (id)initWithRequestType:(TeamRequestType)requestType objects:(NSArray *)valueObjects onlyIds:(BOOL)onlyIds{
	if (self = [super init]) {
		_requestType = requestType;
		objects = [NSMutableArray arrayWithArray:valueObjects];
		idsOnly = onlyIds;
	}
	
	return self;
}

- (NSURLRequest *)urlRequest {
	NSURLRequest *request = nil;
	switch ([self requestType]) {
		case LOAN_TEAMS:
			request = [self teamsForLoanRequest];
			break;
		case SHORTNAME:
			request = [self teamsForShortnameRequest];
			break;
		default:
			request = [self teamsForLenderRequest];
			break;
	}
	
	return request;
}

#pragma mark - NSURLRequestConstruction methods

- (NSURLRequest *)teamsForLoanRequest {
	if ([[KivaRequestManager appID] isEqualToString:@""]) {
		if (idsOnly) {
			return [self urlRequestFromString:[kLoansApiUrlString stringByAppendingFormat:@"%@%@?%@=true",
											   [self listObjects],
											   kApiPath,
											   kIdsOnly]];
		} else {
			return [self urlRequestFromString:[kLoansApiUrlString stringByAppendingFormat:@"%@%@",
											   [self listObjects],
											   kApiPath]];
		}
	}
	
	if (idsOnly) {
		return [self urlRequestFromString:[kLoansApiUrlString stringByAppendingFormat:@"%@%@?%@=%@&%@=true",
										   [self listObjects],
										   kApiPath,
										   kAppId,
										   [KivaRequestManager appID],
										   kIdsOnly]];
	}
	
	return [self urlRequestFromString:[kLoansApiUrlString stringByAppendingFormat:@"%@%@?%@=%@",
									   [self listObjects],
									   kApiPath,
									   kAppId,
									   [KivaRequestManager appID]]];
}

- (NSURLRequest *)teamsForLenderRequest {
	if ([[KivaRequestManager appID] isEqualToString:@""]) {
		if (idsOnly) {
			return [self urlRequestFromString:[kLenderApiUrlString stringByAppendingFormat:@"%@%@?%@=true",
											   [self listObjects],
											   kApiPath,
											   kIdsOnly]];
		}
		
		return [self urlRequestFromString:[kLenderApiUrlString stringByAppendingFormat:@"%@%@",
										   [self listObjects],
										   kApiPath]];
	}
	
	if (idsOnly) {
		return [self urlRequestFromString:[kLenderApiUrlString stringByAppendingFormat:@"%@%@?%@=%@&%@=true",
										   [self listObjects],
										   kApiPath,
										   kAppId,
										   [KivaRequestManager appID],
										   kIdsOnly]];
	}
	
	return [self urlRequestFromString:[kLenderApiUrlString stringByAppendingFormat:@"%@%@?%@=%@",
									   [self listObjects],
									   kApiPath,
									   kAppId,
									   [KivaRequestManager appID]]];
}

- (NSURLRequest *)teamsForShortnameRequest {
	if ([[KivaRequestManager appID] isEqualToString:@""]) {
		if (idsOnly) {
			return [self urlRequestFromString:[kShortnameApiUrlString stringByAppendingFormat:@"%@.%@?%@=true",
											   [self listObjects],
											   kJsonFormat,
											   kIdsOnly]];
		}
		
		return [self urlRequestFromString:[kShortnameApiUrlString stringByAppendingFormat:@"%@.%@",
										   [self listObjects],
										   kJsonFormat]];
	}
	
	if (idsOnly) {
		return [self urlRequestFromString:[kShortnameApiUrlString stringByAppendingFormat:@"%@.%@?%@=%@&%@=true",
										   [self listObjects],
										   kJsonFormat,
										   kAppId,
										   [KivaRequestManager appID],
										   kIdsOnly]];
	}
	
	return [self urlRequestFromString:[kShortnameApiUrlString stringByAppendingFormat:@"%@.%@?%@=%@",
									   [self listObjects],
									   kJsonFormat,
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
	} else if ([self requestType] == LENDER_TEAMS) {
		for (NSObject *o in objects) {
			if ([o isKindOfClass:[NSString class]]) {
				value = [value stringByAppendingFormat:@"%@", ((NSString *)o)];
				break;
			}
		}
	} else if ([self requestType] == SHORTNAME) {
		NSString *delimiter = @"";
		for (NSObject *o in objects) {
			if ([o isKindOfClass:[NSString class]]) {
				value = [value stringByAppendingFormat:@"%@%@", delimiter, ((NSString *)o)];
				delimiter = @",";
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

- (BOOL)onlyIds {
	return idsOnly;
}

#pragma mark - Requests

+ (instancetype)teamsForLoanId:(NSNumber *)loanId {
	return [[KivaTeamRequest alloc] initWithRequestType:LOAN_TEAMS objects:[NSArray arrayWithObjects:loanId, nil]];
}

+ (instancetype)teamsForLoanId:(NSNumber *)loanId onlyIds:(BOOL)onlyIds {
	return [[KivaTeamRequest alloc] initWithRequestType:LOAN_TEAMS objects:[NSArray arrayWithObjects:loanId, nil] onlyIds:onlyIds];
}

+ (instancetype)teamsForLenderId:(NSString *)lenderId {
	return [[KivaTeamRequest alloc] initWithRequestType:LENDER_TEAMS objects:[NSArray arrayWithObjects:lenderId, nil]];
}

+ (instancetype)teamsForLenderId:(NSString *)lenderId onlyIds:(BOOL)onlyIds {
	return [[KivaTeamRequest alloc] initWithRequestType:LENDER_TEAMS objects:[NSArray arrayWithObjects:lenderId, nil] onlyIds:onlyIds];
}

+ (instancetype)teamWithShortname:(NSString *)shortname {
	return [KivaTeamRequest teamsWithShortnames:[NSArray arrayWithObject:shortname]];
}

+ (instancetype)teamsWithShortnames:(NSArray *)shortnames {
	if (shortnames && [shortnames count] > 20) {
		NSLog(@"API only supports up max 20 shortnames at a time");
	}

	return [[KivaTeamRequest alloc] initWithRequestType:SHORTNAME objects:shortnames];
}

+ (instancetype)teamsWithShortnames:(NSArray *)shortnames onlyIds:(BOOL)onlyIds {
	return [[KivaTeamRequest alloc] initWithRequestType:SHORTNAME objects:shortnames onlyIds:onlyIds];
}

@end
