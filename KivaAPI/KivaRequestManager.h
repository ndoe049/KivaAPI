//
//  KivaRequestManager.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/7/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>
#import "KivaLoanRequest.h"
#import "KivaPartnerRequest.h"
#import "KivaLenderRequest.h"
#import "KivaTeamRequest.h"
#import "KivaRepaymentRequest.h"
#import "KivaImage.h"

static const NSString *kAppId	= @"app_id";

typedef void (^loanRequestCompletionHandler)(BOOL success, NSArray *loans, NSError *error);
typedef void (^imageRequestCompletionHandler)(BOOL success, UIImage *image, NSError *error);
typedef void (^partnerRequestCompletionHandler)(BOOL success, NSArray *partners, NSError *error);
typedef void (^lendersRequestCompletionHandler)(BOOL success, NSArray *lenders, NSError *error);
typedef void (^teamsRequestCompletionHandler)(BOOL success, NSArray *teams, NSError *error);
typedef void (^repaymentCompletionHandler)(BOOL success, NSArray *repayments, NSError *error);

@interface KivaRequestManager : NSObject

//Loan Requests
+ (void)sendLoanRequest:(KivaLoanRequest *)request
	withCompletionHandler:(loanRequestCompletionHandler)completionHandler;

//Image Requests (could use SDWebImage or something similar also)
+ (void)fetchImage:(KivaImage *)image forSize:(ImageSize)size
	withCompletionHandler:(imageRequestCompletionHandler)completionHandler;

+ (void)sendPartnerRequest:(KivaPartnerRequest *)request
	 withCompletionHandler:(partnerRequestCompletionHandler)completionHandler;

+ (void)sendLenderRequest:(KivaLenderRequest *)request
	withCompletionHandler:(lendersRequestCompletionHandler)completionHandler;

+ (void)sendTeamRequest:(KivaTeamRequest *)request
  withCompletionHandler:(teamsRequestCompletionHandler)completionHandler;

+ (void)sendRepaymentRequest:(KivaRepaymentRequest *)request
  withCompletionHandler:(repaymentCompletionHandler)completionHandler;

+ (void)addAppId:(NSString *)appId;
+ (NSString *)appID;

@end
