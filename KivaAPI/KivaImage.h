//
//  KivaImage.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/8/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ImageSize) {
	SQUARE_80,
	SQUARE_200,
	SQAURE_300,
	LANDSCAPE_325_250,
	LANDSCAPE_450_360,
	FULLSIZE
};

@interface KivaImage : NSObject

@property (nonatomic, readonly) NSNumber *imageId;
@property (nonatomic, readonly) NSNumber *templateId;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (NSString *)urlForImageSize:(ImageSize)size;

@end
