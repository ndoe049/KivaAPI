//
//  KivaLocalPayment.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/12/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FromJSON.h"

@interface KivaLocalPayment : NSObject <FromJSON>

@property (nonatomic, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSDate *dueDate;

@end
