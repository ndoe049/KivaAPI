//
//  KivaTeamRequest.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/20/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TeamRequestType) {
	LOAN_TEAMS,
	LENDER_TEAMS,
	TEAMS_SEARCH,
	SHORTNAME
};

@interface KivaTeamRequest : NSObject {
	NSMutableArray *objects;
	BOOL idsOnly;
}

@property (nonatomic, readonly) TeamRequestType requestType;

+ (instancetype)teamsForLoanId:(NSNumber *)loanId;
+ (instancetype)teamsForLoanId:(NSNumber *)loanId onlyIds:(BOOL)onlyIds;
+ (instancetype)teamsForLenderId:(NSString *)lenderId;
+ (instancetype)teamsForLenderId:(NSString *)lenderId onlyIds:(BOOL)onlyIds;
+ (instancetype)teamWithShortname:(NSString *)shortname;
+ (instancetype)teamsWithShortnames:(NSArray *)shortnames;
+ (instancetype)teamsWithShortnames:(NSArray *)shortnames onlyIds:(BOOL)onlyIds;

- (NSURLRequest *)urlRequest;
- (BOOL)onlyIds;

@end
