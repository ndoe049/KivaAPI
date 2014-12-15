//
//  KivaBorrower.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/12/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FromJSON.h"

typedef NS_ENUM(NSInteger, Gender) {
	MALE,
	FEMALE
};

@interface KivaBorrower : NSObject <FromJSON>

@property (nonatomic, readonly) NSString *firstName;
@property (nonatomic, readonly) NSString *lastName;
@property (nonatomic, readonly) Gender gender;
@property (nonatomic, getter = isPictured) BOOL pictured;

@end
