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
#import "KivaImage.h"

typedef void (^loanRequestCompletionHandler)(BOOL success, NSArray *loans, NSError *error);
typedef void (^imageRequestCompletionHandler)(BOOL success, UIImage *image, NSError *error);
typedef void (^partnerRequestCompletionHandler)(BOOL success, NSArray *partners, NSError *error);
typedef void (^lendersRequestCompletionHandler)(BOOL success, NSArray *lenders, NSError *error);

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

+ (void)addAppId:(NSString *)appId;
+ (NSString *)appID;

@end
