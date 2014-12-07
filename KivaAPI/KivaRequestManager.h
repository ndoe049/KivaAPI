//
//  KivaRequestManager.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/7/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KivaLoanRequest.h"

typedef void (^loanRequestCompletionHandler)(BOOL success, NSArray *loans, NSError *error);

@interface KivaRequestManager : NSObject

+ (void)sendLoanRequest:(KivaLoanRequest *)request
  withCompletionHandler:(loanRequestCompletionHandler)completionHandler;

+ (void)addAppId:(NSString *)appId;
+ (NSString *)appID;

@end
