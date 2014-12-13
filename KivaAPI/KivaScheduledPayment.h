//
//  KivaScheduledPayment.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/13/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FromJSON.h"

@interface KivaScheduledPayment : NSObject <FromJSON>

@property (nonatomic, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSDate *dueDate;

@end
