//
//  KivaLenderSearchCriteria.h
//  KivaAPI
//
//  Created by Nathan Doe on 1/10/15.
//  Copyright (c) 2015 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KivaLenderSearchCriteria : NSObject

@property (nonatomic, readonly) NSMutableArray *values;

- (void)country:(const NSString *)country;
- (void)countries:(NSArray *)countries;
- (void)occupation:(NSString *)occupation;

- (void)sortByOldest;
- (void)returnIdsOnly;

- (void)query:(NSString *)query;
- (void)page:(NSNumber *)pageNumber;


- (NSString *)build;

- (BOOL)isOnlyIds;

@end
