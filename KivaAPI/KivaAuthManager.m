//
//  KivaAuthManager.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/6/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaAuthManager.h"

@implementation KivaAuthManager

+ (id) sharedManager {
	static KivaAuthManager *sharedInstance = nil;
	
	if (sharedInstance) {
		return sharedInstance;
	}
	
	static dispatch_once_t allocator;
	dispatch_once(&allocator, ^{
		sharedInstance = [[KivaAuthManager alloc] init];
	});
	
	return sharedInstance;
}

@end
