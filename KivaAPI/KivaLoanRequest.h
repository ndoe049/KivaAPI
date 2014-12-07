//
//  KivaLoanRequest.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/6/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, KivaLoanRequestType) {
	kNewestLoansRequest
};

@interface KivaLoanRequest : NSObject

@property (nonatomic) KivaLoanRequestType requestType;

@end
