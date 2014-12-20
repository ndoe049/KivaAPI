//
//  KivaRequestManager.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/7/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaRequestManager.h"
#import "KivaLoan.h"
#import "KivaPartner.h"
#import "KivaLender.h"
#import "KivaTeam.h"

static const NSString *kLoans		= @"loans";
static const NSString *kPartners	= @"partners";
static const NSString *kLenders		= @"lenders";
static const NSString *kTeams		= @"teams";

static NSString *applcationId	= @"";

@implementation KivaRequestManager

#pragma mark - Loan Requests

+ (void)sendLoanRequest:(KivaLoanRequest *)request withCompletionHandler:(loanRequestCompletionHandler)completionHandler {
	[NSURLConnection sendAsynchronousRequest:[request urlRequest] queue:[NSOperationQueue mainQueue]
						   completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
							   if (connectionError) {
								   completionHandler(NO, nil, connectionError);
							   } else if (!response) {
								   completionHandler(NO, nil, nil);
							   } else {
								   NSError *jsonError = nil;
								   NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
																								  options:NSJSONReadingAllowFragments
																									error:&jsonError];
								   if ([jsonDictionary isKindOfClass:[NSDictionary class]]) {
									   jsonError = [self errorsForJSON:jsonDictionary];
								   }
								   
								   if (!jsonError) {
									   NSArray *loanDictionaries = [jsonDictionary objectForKey:kLoans];
									   NSMutableArray *values = [[NSMutableArray alloc] init];
									   
									   if ([[request criteria] isOnlyIds]) {
										   for (NSNumber *n in loanDictionaries) {
											   [values addObject:[[KivaLoan alloc] initWithDictionary:[NSDictionary dictionaryWithObjectsAndKeys:n, @"id", nil]]];
										   }
									   } else {
										   for (NSDictionary *d in loanDictionaries) {
											   [values addObject:[[KivaLoan	alloc] initWithDictionary:d
																							 detailed:[request requestType] == LOAN_DETAILS]];
										   }
									   }
									   
									   
									   completionHandler(YES, [NSArray arrayWithArray:values], nil);
								   } else {
									   completionHandler(NO, nil, jsonError);
								   }
							   }
	
	}];
}

#pragma mark - Image Requests

+ (void)fetchImage:(KivaImage *)image forSize:(ImageSize)size withCompletionHandler:(imageRequestCompletionHandler)completionHandler {
	[NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[image urlForImageSize:size]]]
									   queue:[NSOperationQueue mainQueue]
						   completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
							   if (connectionError) {
								   completionHandler(NO, nil, connectionError);
							   } else if (!response) {
								   completionHandler(NO, nil, nil);
							   } else {
								   completionHandler(YES, [UIImage imageWithData:data], nil);
							   }
	}];
}

#pragma mark - Partner Requests

+ (void)sendPartnerRequest:(KivaPartnerRequest *)request withCompletionHandler:(partnerRequestCompletionHandler)completionHandler {
	[NSURLConnection sendAsynchronousRequest:[request urlRequest]queue:[NSOperationQueue mainQueue]
						   completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
							   if (connectionError) {
								   completionHandler(NO, nil, connectionError);
							   } else if (!response) {
								   completionHandler(NO, nil, nil);
							   } else {
								   NSError *jsonError = nil;
								   NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
																								  options:NSJSONReadingAllowFragments
																									error:&jsonError];
								   if ([jsonDictionary isKindOfClass:[NSDictionary class]]) {
									   jsonError = [self errorsForJSON:jsonDictionary];
								   }
								   
								   if (!jsonError) {
									   NSArray *loanDictionaries = [jsonDictionary objectForKey:kPartners];
									   NSMutableArray *values = [[NSMutableArray alloc] init];
									   
									   for (NSDictionary *d in loanDictionaries) {
										   [values addObject:[[KivaPartner alloc] initWithDictionary:d]];
									   }
									   
									   completionHandler(YES, [NSArray arrayWithArray:values], nil);
								   } else {
									   completionHandler(NO, nil, jsonError);
								   }
							   }
	}];
}

#pragma mark - Lender Requests

+ (void)sendLenderRequest:(KivaLenderRequest *)request withCompletionHandler:(lendersRequestCompletionHandler)completionHandler {
	[NSURLConnection sendAsynchronousRequest:[request urlRequest] queue:[NSOperationQueue mainQueue]
						   completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
							   if (connectionError) {
								   completionHandler(NO, nil, connectionError);
							   } else if (!response) {
								   completionHandler(NO, nil, nil);
							   } else {
								   NSError *jsonError = nil;
								   NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
																								  options:NSJSONReadingAllowFragments
																									error:&jsonError];
								   if ([jsonDictionary isKindOfClass:[NSDictionary class]]) {
									   jsonError = [self errorsForJSON:jsonDictionary];
								   }
								   
								   if (!jsonError) {
									   NSArray *loanDictionaries = [jsonDictionary objectForKey:kLenders];
									   NSMutableArray *values = [[NSMutableArray alloc] init];
									   
									   for (NSDictionary *d in loanDictionaries) {
										   [values addObject:[[KivaLender alloc] initWithDictionary:d]];
									   }
									   
									   completionHandler(YES, [NSArray arrayWithArray:values], nil);
								   } else {
									   completionHandler(NO, nil, jsonError);
								   }
							   }
	}];
}

#pragma mark - Team Requests

+ (void)sendTeamRequest:(KivaTeamRequest *)request withCompletionHandler:(teamsRequestCompletionHandler)completionHandler {
	[NSURLConnection sendAsynchronousRequest:[request urlRequest] queue:[NSOperationQueue mainQueue]
						   completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
							   if (connectionError) {
								   completionHandler(NO, nil, connectionError);
							   } else if (!response) {
								   completionHandler(NO, nil, nil);
							   } else {
								   NSError *jsonError = nil;
								   NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
																								  options:NSJSONReadingAllowFragments
																									error:&jsonError];
								   if ([jsonDictionary isKindOfClass:[NSDictionary class]]) {
									   jsonError = [self errorsForJSON:jsonDictionary];
								   }
								   
								   if (!jsonError) {
									   NSArray *loanDictionaries = [jsonDictionary objectForKey:kTeams];
									   NSMutableArray *values = [[NSMutableArray alloc] init];
									   
									   for (NSDictionary *d in loanDictionaries) {
										   [values addObject:[[KivaTeam alloc] initWithDictionary:d]];
									   }
									   
									   completionHandler(YES, [NSArray arrayWithArray:values], nil);
								   } else {
									   completionHandler(NO, nil, jsonError);
								   }
							   }
	}];
}

#pragma mark - Helper methods

+ (NSError *)errorsForJSON:(NSDictionary *)jsonDictionary {
	if (jsonDictionary && (id)jsonDictionary != [NSNull null]) {
		NSString *code = [jsonDictionary objectForKey:@"code"];
		NSString *message = [jsonDictionary objectForKey:@"message"];
		if (code || message) {
			NSString *fullError = [code stringByAppendingFormat:@" : %@", message];
			NSLog(@"%@", fullError);
			
			NSError *error = [[NSError alloc] initWithDomain:@"KivaRequestManager"
														code:1
													userInfo:@{NSLocalizedDescriptionKey: fullError}];
			return error;
		}
	}
	
	return nil;
}

#pragma mark - App ID

+ (void)addAppId:(NSString *)appId {
	NSAssert(appId, @"App ID cannot be nil");
	applcationId = appId;
}

+ (NSString *)appID {
	return applcationId;
}

@end