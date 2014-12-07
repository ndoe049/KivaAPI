//
//  KivaAuthManager.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/6/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KivaAuthManager : NSObject

@property (nonatomic, getter = isAuthorized) BOOL authorized;

+ (id) sharedManager;

@end
