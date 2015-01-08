//
//  KivaTeam.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/20/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FromJSON.h"

@class KivaImage;

@interface KivaTeam : NSObject <FromJSON>

@property (nonatomic, readonly) NSString *category;
@property (nonatomic, readonly) NSString *teamDescription;
@property (nonatomic, readonly) NSNumber *teamId;
@property (nonatomic, readonly) KivaImage *image;
@property (nonatomic, readonly) NSString *loanBecause;
@property (nonatomic, readonly) NSNumber *loanCount;
@property (nonatomic, readonly) NSNumber *loanedAmount;
@property (nonatomic, readonly) NSNumber *memberCount;
@property (nonatomic, readonly) NSString *membershipType;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *shortName;
@property (nonatomic, readonly) NSDate *teamSince;
@property (nonatomic, readonly) NSURL *websiteUrl;
@property (nonatomic, readonly) NSString *whereabouts;

@end
