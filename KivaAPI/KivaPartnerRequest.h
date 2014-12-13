//
//  KivaPartnerRequest.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/13/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//
// http://build.kiva.org/docs/data/loans

#import <Foundation/Foundation.h>

@interface KivaPartnerRequest : NSObject

+ (instancetype)listPartners;

- (NSURLRequest *)urlRequest;

@end
