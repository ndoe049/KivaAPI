//
//  KivaTeamRequest.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/20/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TeamRequestType) {
	LOAN_TEAMS
};

@interface KivaTeamRequest : NSObject {
	NSMutableArray *objects;
}

@property (nonatomic, readonly) TeamRequestType requestType;

+ (instancetype)teamsForLoanId:(NSNumber *)loanId;

- (NSURLRequest *)urlRequest;

@end
