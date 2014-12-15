//
//  KivaScheduledPayment.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/13/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaScheduledPayment.h"

static const NSString *kAmount	= @"amount";
static const NSString *kDueDate	= @"due_date";

@implementation KivaScheduledPayment

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_amount = [NSNumber numberWithFloat:[[dictionary objectForKey:kAmount] floatValue]];
		
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
		_dueDate = [formatter dateFromString:[dictionary objectForKey:kDueDate]];
	}
	
	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaScheduledPayment[amount = %f, dueDate = %@]",
			[_amount floatValue],
			_dueDate];
}

@end
