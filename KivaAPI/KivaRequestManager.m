//
//  KivaRequestManager.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/7/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaRequestManager.h"

static const NSString *kLoans	= @"loans";

static NSString *applcationId	= @"";

@implementation KivaRequestManager

+ (void)sendLoanRequest:(KivaLoanRequest *)request withCompletionHandler:(loanRequestCompletionHandler)completionHandler {
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
									   completionHandler(YES, [jsonDictionary objectForKey:kLoans], nil);
								   } else {
									   completionHandler(NO, nil, jsonError);
								   }
							   }
	
	}];
}

#pragma mark - Helper methods

+ (NSError *)errorsForJSON:(NSDictionary *)jsonDictionary {
	if (jsonDictionary && (id)jsonDictionary != [NSNull null]) {
		NSArray *errors = [jsonDictionary objectForKey:@"errors"];
		if (errors) {
			NSError *error = [[NSError alloc] initWithDomain:@"KivaRequestManager"
														code:1
													userInfo:@{NSLocalizedDescriptionKey: [errors firstObject]}];
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