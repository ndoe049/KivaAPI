//
//  KivaLender.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/14/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//
// http://build.kiva.org/docs/data/lenders

#import <Foundation/Foundation.h>
#import "FromJSON.h"

@class KivaImage;

@interface KivaLender : NSObject <FromJSON>

@property (nonatomic, readonly) NSString *countryCode;
@property (nonatomic, readonly) KivaImage *image;
@property (nonatomic, readonly) NSString *lenderId;
@property (nonatomic, readonly) NSString *lenderName;
@property (nonatomic, readonly) NSString *uid;
@property (nonatomic, readonly) NSString *whereAbouts;

@end
