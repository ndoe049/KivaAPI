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
#import "KivaImage.h"

typedef void (^loanRequestCompletionHandler)(BOOL success, NSArray *loans, NSError *error);
typedef void (^imageRequestCompletionHandler)(BOOL success, UIImage *image, NSError *error);

@interface KivaRequestManager : NSObject

//Loan Requests
+ (void)sendLoanRequest:(KivaLoanRequest *)request
	withCompletionHandler:(loanRequestCompletionHandler)completionHandler;

//Image Requests (could use SDWebImage or something similar also)
+ (void)fetchImage:(KivaImage *)image forSize:(ImageSize)size
	withCompletionHandler:(imageRequestCompletionHandler)completionHandler;

+ (void)addAppId:(NSString *)appId;
+ (NSString *)appID;

@end
